# Levantamento bibliográfico

Palavras-chave, strings de busca e referências comentadas.

[Abrir o PDF](levantamento-bibliografico.pdf)

[PDFs dos artigos citados](artigos/)

## Compilar

Requer Typst ou Nix.

```bash
./build.sh          # gera o PDF
./build.sh watch    # recompila ao salvar
```

Inclua o PDF atualizado no commit ao alterar o documento.

## Editar

- `dados.typ`: identificação e apresentação.
- `palavras-chave.txt` e `strings-de-busca.txt`: uma entrada por linha.
- `referencias.bib`: referências em BibTeX.
- `entradas.typ`: chaves das referências, temas e justificativas.
- `main.typ`: layout.

Para adicionar uma referência, coloque o BibTeX em `referencias.bib` e use
sua chave em `entradas.typ`.

Para converter RIS em BibTeX, use `./ris2bib.sh artigo.ris` (requer bibutils ou Nix).

## Estilo de referências e ABNT

O estilo `abnt.csl` vem do [ABNTyp](https://github.com/3sdras/abntyp).
Licença: [abnt.LICENSE](abnt.LICENSE).
