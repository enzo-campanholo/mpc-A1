#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "uso: $0 arquivo.ris [arquivo.ris ...]" >&2
  exit 1
fi

files=()
for file in "$@"; do
  [ -f "$file" ] && [ -r "$file" ] || {
    echo "$0: não consigo ler '$file'" >&2
    exit 1
  }
  if [[ $file != /* ]]; then
    file="./$file"
  fi
  files+=("$file")
done

if command -v ris2xml >/dev/null 2>&1 && command -v xml2bib >/dev/null 2>&1; then
  converter=(bash)
elif command -v nix >/dev/null 2>&1; then
  converter=(nix shell --extra-experimental-features "nix-command flakes" nixpkgs#bibutils --command bash)
else
  echo "$0: instale bibutils ou Nix para converter arquivos RIS" >&2
  exit 1
fi

"${converter[@]}" -euo pipefail -c 'ris2xml "$@" | xml2bib -b -w' _ "${files[@]}" |
  sed '1s/^\xEF\xBB\xBF//' |
  awk '
      # O bibutils exporta o nome do evento em series; o CSL lê booktitle.
      BEGIN { RS = ""; ORS = "\n\n" }
      {
        rec = $0
        if (tolower(rec) ~ /^@inproceedings/ &&
            rec ~ /series[ \t]*=/ && rec !~ /booktitle[ \t]*=/) {
          sub(/series[ \t]*=/, "booktitle =", rec)
        }
        print rec
      }'
