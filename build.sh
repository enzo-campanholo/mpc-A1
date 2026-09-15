#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -gt 1 ] || [[ ! ${1:-compile} =~ ^(compile|watch)$ ]]; then
  echo "uso: $0 [compile|watch]" >&2
  exit 1
fi

cd -- "$(dirname -- "$0")"
output="levantamento-bibliografico.pdf"

if command -v typst >/dev/null 2>&1; then
  compiler=(typst)
elif command -v nix >/dev/null 2>&1; then
  compiler=(nix run --extra-experimental-features "nix-command flakes" nixpkgs#typst --)
else
  echo "$0: instale Typst ou Nix para compilar o documento" >&2
  exit 1
fi

case "${1:-compile}" in
  watch)
    exec "${compiler[@]}" watch main.typ "$output"
    ;;
  compile)
    "${compiler[@]}" compile main.typ "$output"
    echo "PDF gerado: $output"
    ;;
esac
