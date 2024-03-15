
pkgs.substituteAll {
  src = ./template.toml
  templateVar = "myvalue";
}
