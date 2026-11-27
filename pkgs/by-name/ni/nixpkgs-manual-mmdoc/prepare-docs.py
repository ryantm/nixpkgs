#!/usr/bin/env python3
"""Prepare upstream Nixpkgs doc/ sources and lib-functions.json for mmdoc."""

import json
import pathlib
import re
import sys

INCLUDE_BLOCK_RE = re.compile(r"\n?```\{=include=\}[^\n]*\n.*?```\n?", re.DOTALL)
FENCED_DIV_RE = re.compile(r"^(\s*):::\s*\{#([^\s.}]+)\s+\.([^\s.}]+)\}\s*$")
HEADING_RE = re.compile(r"^(#{1,6})(\s+.*)$")


def format_description(text: str) -> str:
    lines = text.splitlines()
    out = []
    in_fence = False
    fence_char = ""
    fence_len = 0

    for line in lines:
        stripped = line.lstrip()
        if not in_fence:
            m_fence = re.match(r"^(`{3,}|~{3,})", stripped)
            if m_fence:
                in_fence = True
                fence_char = m_fence.group(1)[0]
                fence_len = len(m_fence.group(1))
                out.append(line)
                continue
            m_div = FENCED_DIV_RE.match(line)
            if m_div:
                out.append(f"{m_div.group(1)}::: {{.{m_div.group(3)} #{m_div.group(2)}}}")
                continue
            m_head = HEADING_RE.match(line)
            if m_head:
                level = min(6, len(m_head.group(1)) + 2)
                out.append("#" * level + m_head.group(2))
                continue
            out.append(line)
        else:
            if stripped.startswith(fence_char * fence_len) and stripped.strip(fence_char).strip() == "":
                in_fence = False
            elif stripped == ":::":
                # Guard against unclosed code fences before closing a fenced div.
                out.append(fence_char * fence_len)
                in_fence = False
            out.append(line)

    if in_fence:
        out.append(fence_char * fence_len)
    return "\n".join(out)


def render_lib_docs(lib_functions_json: pathlib.Path, out_dir: pathlib.Path) -> None:
    data = json.loads(lib_functions_json.read_text())
    entries_by_group: dict[str, list[dict]] = {g["id"]: [] for g in data["groups"]}
    for entry in data["entries"]:
        for group_id in entry.get("groups", []):
            entries_by_group.setdefault(group_id, []).append(entry)

    out_dir.mkdir(parents=True, exist_ok=True)
    for group in data["groups"]:
        gid = group["id"]
        desc = group.get("description")
        title = f"`lib.{gid}`: {desc}" if desc else f"`lib.{gid}`"
        parts = [f"# {title} {{#sec-functions-library-{gid}}}\n"]
        for entry in entries_by_group.get(gid, []):
            entry_id = entry["id"]
            attr_path = entry.get("attrPath", entry_id)
            parts.append(f"\n## `{attr_path}` {{#function-library-{entry_id}}}\n\n")
            description = entry.get("description", "").strip()
            if description:
                parts.append(format_description(description))
                parts.append("\n")
        (out_dir / f"{gid}.md").write_text("".join(parts))


def strip_include_blocks(doc_dir: pathlib.Path) -> None:
    for path in doc_dir.rglob("*.md"):
        text = path.read_text()
        if "{=include=}" not in text:
            continue
        cleaned = INCLUDE_BLOCK_RE.sub("\n", text)
        path.write_text(cleaned)


def main() -> None:
    doc_dir = pathlib.Path(sys.argv[1])
    lib_json = pathlib.Path(sys.argv[2])
    strip_include_blocks(doc_dir)
    render_lib_docs(lib_json, doc_dir / "functions" / "library")


if __name__ == "__main__":
    main()
