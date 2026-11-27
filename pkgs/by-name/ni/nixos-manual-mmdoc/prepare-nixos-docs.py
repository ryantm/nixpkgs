#!/usr/bin/env python3
"""Prepare upstream NixOS manual sources, module chapters, and options.json for mmdoc."""

import collections
import json
import pathlib
import re
import shutil
import sys

XML_ID_TABLE = str.maketrans(
    {
        "*": "_",
        "<": "_",
        " ": "_",
        ">": "_",
        "[": "_",
        "]": "_",
        ":": "_",
        '"': "_",
    }
)

INCLUDE_BLOCK_RE = re.compile(r"\n?```\{=include=\}[^\n]*\n.*?```\n?", re.DOTALL)
FENCED_DIV_ID_FIRST_RE = re.compile(r"^(\s*):::\s*\{#([^\s.}]+)\s+\.([^\s.}]+)\}\s*$")
FENCED_DIV_TIGHT_RE = re.compile(r"^(\s*):::\{([^}]+)\}\s*$")
HEADING_RE = re.compile(r"^(#{1,6})(\s+.*)$")
TOP_ANCHOR_RE = re.compile(r"^#+\s+.*?\s+\{#([^}\s]+)\}\s*$")
ROLE_RE = re.compile(
    r"\{(option|command|file|env|var|manpage|literal|domain|hostname|ip|id|label|name)\}(`+)([^`]+?)\2",
    re.DOTALL,
)
OPTIONS_HTML_LINK_RE = re.compile(r"\(options\.html#(opt-[^)\s]+)\)")
FENCE_OPEN_RE = re.compile(r"^(\s*)(`{3,}|~{3,})(.*)$")

GITHUB_BLOB_BASE = "https://github.com/NixOS/nixpkgs/blob/master/"


def make_xml_id(name: str) -> str:
    return name.translate(XML_ID_TABLE)


def inline_code(text: str) -> str:
    longest = 0
    cur = 0
    for ch in text:
        if ch == "`":
            cur += 1
            if cur > longest:
                longest = cur
        else:
            cur = 0
    ticks = "`" * (longest + 1)
    if text.startswith("`") or text.endswith("`"):
        return f"{ticks} {text} {ticks}"
    return f"{ticks}{text}{ticks}"


def fenced_code(text: str, lang: str = "nix") -> str:
    longest = 2
    for m in re.finditer(r"`{3,}", text):
        if len(m.group(0)) > longest:
            longest = len(m.group(0))
    fence = "`" * (longest + 1)
    body = text.rstrip("\n")
    return f"{fence}{lang}\n{body}\n{fence}"


def replace_roles_in_text(text: str, known_option_ids: set[str]) -> str:
    if "{" in text and "`" in text:

        def repl(m: re.Match) -> str:
            role = m.group(1)
            content = " ".join(m.group(3).split())
            code = inline_code(content)
            if role == "option":
                opt_id = "opt-" + make_xml_id(content)
                if opt_id in known_option_ids:
                    return f"[{code}](#{opt_id})"
            return code

        text = ROLE_RE.sub(repl, text)

    if "options.html#opt-" in text:

        def link_repl(m: re.Match) -> str:
            opt_id = m.group(1)
            if opt_id in known_option_ids:
                return f"(#{opt_id})"
            return m.group(0)

        text = OPTIONS_HTML_LINK_RE.sub(link_repl, text)

    return text


def sanitize_markdown(
    text: str,
    known_option_ids: set[str],
    heading_shift: int = 0,
    strip_includes: bool = False,
) -> str:
    if strip_includes and "{=include=}" in text:
        text = INCLUDE_BLOCK_RE.sub("\n", text)

    lines = text.splitlines()
    out: list[str] = []
    prose_buf: list[str] = []
    in_fence = False
    fence_char = ""
    fence_len = 0

    def flush_prose() -> None:
        if prose_buf:
            chunk = "\n".join(prose_buf)
            out.append(replace_roles_in_text(chunk, known_option_ids))
            prose_buf.clear()

    for line in lines:
        stripped = line.lstrip()
        if not in_fence:
            m_fence = FENCE_OPEN_RE.match(line)
            if m_fence:
                flush_prose()
                in_fence = True
                fence_char = m_fence.group(2)[0]
                fence_len = len(m_fence.group(2))
                out.append(line)
                continue

            m_div_id = FENCED_DIV_ID_FIRST_RE.match(line)
            if m_div_id:
                prose_buf.append(
                    f"{m_div_id.group(1)}::: {{.{m_div_id.group(3)} #{m_div_id.group(2)}}}"
                )
                continue

            m_div_tight = FENCED_DIV_TIGHT_RE.match(line)
            if m_div_tight:
                prose_buf.append(f"{m_div_tight.group(1)}::: {{{m_div_tight.group(2)}}}")
                continue

            if heading_shift > 0:
                m_head = HEADING_RE.match(line)
                if m_head:
                    level = min(6, len(m_head.group(1)) + heading_shift)
                    line = "#" * level + m_head.group(2)

            prose_buf.append(line)
        else:
            if (
                stripped.startswith(fence_char * fence_len)
                and stripped.strip(fence_char).strip() == ""
            ):
                in_fence = False
            elif stripped == ":::":
                out.append(fence_char * fence_len)
                in_fence = False
            out.append(line)

    flush_prose()
    if in_fence:
        out.append(fence_char * fence_len)
    return "\n".join(out) + "\n"


def format_option_value(val: dict, known_option_ids: set[str]) -> str:
    vtype = val.get("_type")
    text = val.get("text", "")
    if vtype == "literalMD":
        return sanitize_markdown(text, known_option_ids).strip()
    if "\n" in text:
        return "\n\n" + fenced_code(text, "nix")
    return inline_code(text)


def format_declaration(decl) -> str:
    if isinstance(decl, dict):
        name = decl.get("name", "")
        url = decl.get("url", "")
        if url:
            return f"[{inline_code(name)}]({url})"
        return inline_code(name)
    text = str(decl)
    if text.startswith("http://") or text.startswith("https://"):
        return f"[{inline_code(text)}]({text})"
    return f"[{inline_code(text)}]({GITHUB_BLOB_BASE}{text})"


def format_single_option(
    name: str,
    opt: dict,
    id_prefix: str,
    heading_level: int,
    known_option_ids: set[str],
) -> str:
    opt_id = make_xml_id(id_prefix + name)
    # Escape underscores so CommonMark does not parse _name_ inside {#id} as emphasis.
    md_opt_id = opt_id.replace("_", "\\_")
    hashes = "#" * heading_level
    parts = [f"\n{hashes} {inline_code(name)} {{#{md_opt_id}}}\n\n"]

    desc = (opt.get("description") or "").strip()
    if desc:
        parts.append(
            sanitize_markdown(desc, known_option_ids, heading_shift=heading_level)
        )
        parts.append("\n")

    opt_type = opt.get("type")
    if opt_type:
        parts.append(f"*Type:* {opt_type}\n\n")

    if "default" in opt:
        formatted = format_option_value(opt["default"], known_option_ids)
        if formatted.startswith("\n"):
            parts.append(f"*Default:*{formatted}\n\n")
        else:
            parts.append(f"*Default:* {formatted}\n\n")

    if "example" in opt:
        formatted = format_option_value(opt["example"], known_option_ids)
        if formatted.startswith("\n"):
            parts.append(f"*Example:*{formatted}\n\n")
        else:
            parts.append(f"*Example:* {formatted}\n\n")

    if opt.get("readOnly"):
        parts.append("*Read only*\n\n")

    related = opt.get("relatedPackages")
    if related:
        parts.append(
            f"*Related packages:*\n\n{sanitize_markdown(str(related), known_option_ids)}\n"
        )

    decls = opt.get("declarations") or []
    if decls:
        if len(decls) == 1:
            parts.append(f"*Declared by:* {format_declaration(decls[0])}\n")
        else:
            parts.append("*Declared by:*\n")
            for decl in decls:
                parts.append(f"- {format_declaration(decl)}\n")

    return "".join(parts)


def render_inline_options(
    options_path: pathlib.Path,
    id_prefix: str,
    heading_level: int,
    known_option_ids: set[str],
) -> str:
    opts = json.loads(options_path.read_text())
    chunks = []
    for name in sorted(opts.keys()):
        chunks.append(
            format_single_option(
                name, opts[name], id_prefix, heading_level, known_option_ids
            )
        )
    return "\n".join(chunks)


def option_group_key(name: str, top_counts: dict[str, int]) -> tuple[str, str]:
    """Return (group_slug, group_title) for a NixOS option name."""
    parts = name.split(".")
    top = parts[0]
    if top == "services":
        if len(parts) > 1 and parts[1] and parts[1][0].isalpha():
            letter = parts[1][0].lower()
            return (f"services-{letter}", f"services ({letter.upper()})")
        return ("services-other", "services (other)")
    if re.match(r"^[a-zA-Z][a-zA-Z0-9_-]*$", top) and top_counts.get(top, 0) >= 25:
        return (top.lower(), f"{top}")
    return ("other", "Other options")


def generate_nixos_options_pages(
    options_json_path: pathlib.Path,
    doc_dir: pathlib.Path,
    known_option_ids: set[str],
) -> list[tuple[str, str, int]]:
    opts = json.loads(options_json_path.read_text())
    top_counts = collections.Counter(name.split(".")[0] for name in opts)

    grouped: dict[str, list[str]] = collections.defaultdict(list)
    titles: dict[str, str] = {}
    for name in sorted(opts.keys()):
        slug, title = option_group_key(name, top_counts)
        grouped[slug].append(name)
        titles[slug] = title

    # Order: non-services alphabetically, then services-a..services-z, then other.
    def sort_key(slug: str) -> tuple[int, str]:
        if slug == "other":
            return (2, slug)
        if slug.startswith("services-"):
            return (1, slug)
        return (0, slug)

    ordered_slugs = sorted(grouped.keys(), key=sort_key)
    options_dir = doc_dir / "options"
    options_dir.mkdir(parents=True, exist_ok=True)

    group_meta: list[tuple[str, str, int]] = []
    for slug in ordered_slugs:
        names = grouped[slug]
        title = titles[slug]
        anchor = f"sec-options-{slug}"
        chunks = [f"# {title} {{#{anchor}}}\n"]
        for name in names:
            chunks.append(
                format_single_option(name, opts[name], "opt-", 2, known_option_ids)
            )
        (options_dir / f"{slug}.md").write_text("".join(chunks))
        group_meta.append((anchor, title, len(names)))

    # Replace doc/nixos-options.md with a clean index linking all option groups.
    index_lines = [
        "# Configuration Options {#ch-options}\n\n",
        f"NixOS provides {len(opts):,} configuration options grouped by namespace:\n\n",
    ]
    for anchor, title, count in group_meta:
        index_lines.append(f"- [{title}](#{anchor}) ({count:,} options)\n")
    (doc_dir / "nixos-options.md").write_text("".join(index_lines))

    return group_meta


def extract_top_anchor(path: pathlib.Path) -> str | None:
    for line in path.read_text().splitlines():
        m = TOP_ANCHOR_RE.match(line)
        if m:
            return m.group(1)
    return None


def copy_module_chapters(
    module_chapters_json: pathlib.Path,
    doc_dir: pathlib.Path,
) -> list[str]:
    chapters = json.loads(module_chapters_json.read_text())
    mod_dir = doc_dir / "modules"
    mod_dir.mkdir(parents=True, exist_ok=True)
    used_names: set[str] = set()
    anchors: list[str] = []

    for entry in chapters:
        src = pathlib.Path(entry["value"])
        base_id = entry["id"]
        name = base_id
        suffix = 2
        while name in used_names:
            name = f"{base_id}-{suffix}"
            suffix += 1
        used_names.add(name)
        dest = mod_dir / f"{name}.md"
        shutil.copyfile(src, dest)
        anchor = extract_top_anchor(dest)
        if anchor:
            anchors.append(anchor)

    return anchors


def build_toc(
    doc_dir: pathlib.Path,
    nav_path: pathlib.Path,
    version: str,
    module_anchors: list[str],
    option_groups: list[tuple[str, str, int]],
) -> str:
    nav = json.loads(nav_path.read_text())
    lines = [f"# NixOS Manual\n\nVersion {version}\n"]

    def walk(items: list, depth: int) -> None:
        for item in items:
            if item == "@MODULE_CHAPTERS@":
                for anchor in module_anchors:
                    lines.append(f"{'  ' * depth}* [](#{anchor})\n")
                continue
            if "file" in item:
                p = doc_dir / item["file"]
                if p.exists():
                    anchor = extract_top_anchor(p)
                    if anchor:
                        lines.append(f"{'  ' * depth}* [](#{anchor})\n")
            elif "label" in item:
                if depth == 0:
                    lines.append(f"\n## {item['label']}\n\n")
                else:
                    lines.append(f"{'  ' * depth}* {item['label']}\n")
            if "children" in item:
                next_depth = depth if (depth == 0 and "label" in item) else depth + 1
                walk(item["children"], next_depth)

    walk(nav["items"], 0)

    # Configuration Options appendix
    lines.append("\n## Configuration Options\n\n")
    lines.append("* [](#ch-options)\n")
    for anchor, _title, _count in option_groups:
        lines.append(f"  * [](#{anchor})\n")

    # Release Notes appendix (preserve order from release-notes/release-notes.md)
    lines.append("\n## Release Notes\n\n")
    lines.append("* [](#ch-release-notes)\n")
    rn_index = (doc_dir / "release-notes" / "release-notes.md").read_text()
    for m in re.finditer(r"^(rl-[^\s]+\.section\.md)$", rn_index, re.MULTILINE):
        rn_path = doc_dir / "release-notes" / m.group(1)
        if rn_path.exists():
            anchor = extract_top_anchor(rn_path)
            if anchor:
                lines.append(f"  * [](#{anchor})\n")

    return "".join(lines)


def main() -> None:
    config = json.loads(pathlib.Path(sys.argv[1]).read_text())
    doc_dir = pathlib.Path(config["docDir"])
    options_json = pathlib.Path(config["optionsJson"])
    test_options_json = pathlib.Path(config["testOptionsJson"])
    portable_options_json = pathlib.Path(config["portableServiceOptionsJson"])
    systemd_options_json = pathlib.Path(config["systemdServiceOptionsJson"])
    machine_methods_md = pathlib.Path(config["machineMethodsMd"])
    module_chapters_json = pathlib.Path(config["moduleChaptersJson"])
    nav_json = pathlib.Path(config["navJson"])
    version = config["version"]

    # Collect all known option anchor IDs across all option sets.
    known_option_ids: set[str] = set()
    for path, prefix in (
        (options_json, "opt-"),
        (test_options_json, "test-opt-"),
        (portable_options_json, "service-opt-"),
        (systemd_options_json, "systemd-service-opt-"),
    ):
        for name in json.loads(path.read_text()).keys():
            known_option_ids.add(make_xml_id(prefix + name))

    # Copy module chapters from config.meta.doc into doc/modules/.
    module_anchors = copy_module_chapters(module_chapters_json, doc_dir)

    # Expand @PYTHON_MACHINE_METHODS@ and inline test/service option blocks.
    writing_tests = doc_dir / "development" / "writing-nixos-tests.section.md"
    if writing_tests.exists():
        text = writing_tests.read_text()
        text = text.replace("@PYTHON_MACHINE_METHODS@", machine_methods_md.read_text())
        test_opts_md = render_inline_options(
            test_options_json, "test-opt-", 3, known_option_ids
        )
        text = INCLUDE_BLOCK_RE.sub("\n" + test_opts_md + "\n", text, count=1)
        writing_tests.write_text(text)

    modular_services = doc_dir / "development" / "modular-services.md"
    if modular_services.exists():
        text = modular_services.read_text()
        portable_md = render_inline_options(
            portable_options_json, "service-opt-", 3, known_option_ids
        )
        systemd_md = render_inline_options(
            systemd_options_json, "systemd-service-opt-", 3, known_option_ids
        )
        text = INCLUDE_BLOCK_RE.sub("\n" + portable_md + "\n", text, count=1)
        text = INCLUDE_BLOCK_RE.sub("\n" + systemd_md + "\n", text, count=1)
        modular_services.write_text(text)

    # Generate split NixOS configuration option pages and index page.
    option_groups = generate_nixos_options_pages(
        options_json, doc_dir, known_option_ids
    )

    # Generate doc/toc.md from nav.json + module chapters + options + release notes.
    toc_md = build_toc(doc_dir, nav_json, version, module_anchors, option_groups)

    # Sanitize all non-generated Markdown pages (roles, fenced divs, include blocks).
    options_dir = doc_dir / "options"
    for md_path in sorted(doc_dir.rglob("*.md")):
        if options_dir in md_path.parents:
            continue
        cleaned = sanitize_markdown(
            md_path.read_text(), known_option_ids, strip_includes=True
        )
        md_path.write_text(cleaned)

    (doc_dir / "toc.md").write_text(toc_md)


if __name__ == "__main__":
    main()
