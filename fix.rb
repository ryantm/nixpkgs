#! /usr/bin/env nix-shell
#! nix-shell -i ruby -p ruby
require 'json'

entries = File.read("./python_mapping.json").split("\n")
has_lib = File.read("./has_lib.txt").split("\n")
has_lib_hash = {}
has_lib.each do |l|
  has_lib_hash[l] = true
end

new_entries = []
entries.each do |entry|
  parsed = JSON.parse(entry)
  key = parsed.keys.first
  parsed[key]["deps"].map do |dep|
    dep = dep.gsub("pkgs.", "")
    if has_lib_hash[dep]
      parsed[key]["libdeps"] ||= []
      parsed[key]["libdeps"] << "pkgs.#{dep}"
    end
  end
  new_entries << parsed.to_json
end

File.open("./new_python_mapping.json", 'w') do |f|
  new_entries.each do |e|
    f.puts e
  end
end
