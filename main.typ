#import "dados.typ": apresentacao, nota-buscas, nota-palavras, trabalho
#import "entradas.typ": entradas

#let linhas-de(caminho) = {
  read(caminho)
    .split("\n")
    .map(l => l.trim())
    .filter(l => l != "" and not l.starts-with("#"))
}

#let palavras-chave = linhas-de("palavras-chave.txt")
#let buscas = linhas-de("strings-de-busca.txt")

#let tinta = luma(20)
#let suave = luma(125)
#let fio = 0.4pt + luma(200)
#let painel = luma(247)
#let mono = "DejaVu Sans Mono"

#let coluna-rotulos = 2cm

#let colunas(esquerda, direita) = grid(
  columns: (coluna-rotulos, 1fr),
  align: (right + top, left + top),
  column-gutter: 0.7em,
  esquerda, direita,
)

#let rotulo(corpo) = text(size: 8pt, fill: suave, tracking: 0.11em)[#upper(
  corpo,
)]

#let numero(n) = text(size: 9pt, fill: suave)[#n]

#set document(
  title: trabalho.titulo-doc,
  author: trabalho.autores.join("; "),
)

#set page(
  paper: "a4",
  margin: (top: 2.9cm, bottom: 2.7cm, x: 3cm),
  footer: context {
    let n = counter(page).get().first()
    if n > 1 {
      align(center, text(
        size: 8.5pt,
        fill: suave,
        number-type: "old-style",
      )[#n])
    }
  },
)

#set text(
  font: "Libertinus Serif",
  size: 11pt,
  lang: "pt",
  region: "BR",
  fill: tinta,
)
#set par(justify: true, leading: 0.78em, spacing: 1.15em)
#set heading(numbering: "1")

#show heading.where(level: 1): it => block(
  width: 100%,
  above: 2em,
  below: 1.2em,
  breakable: false,
  sticky: true,
)[
  #set par(justify: false)
  #colunas(
    text(size: 12pt, fill: suave, number-type: "old-style")[
      #counter(heading).display(it.numbering)
    ],
    text(size: 12pt, tracking: 0.05em)[#smallcaps(it.body)],
  )
  #v(0.55em)
  #line(length: 100%, stroke: fio)
]

#show heading.where(level: 2): it => block(
  width: 100%,
  above: 1.9em,
  below: 0.85em,
  sticky: true,
)[
  #set par(justify: false)
  #colunas([], text(size: 11pt, weight: "bold", style: "italic")[#it.body])
]

#block(width: 100%)[
  #set par(justify: false, leading: 0.62em)

  #grid(
    columns: (1fr, auto),
    align: (left + top, right + top),
    [
      #text(size: 8.5pt, tracking: 0.13em)[#upper(trabalho.instituicao)]
      #linebreak()
      #text(size: 9.5pt, fill: suave)[
        #trabalho.unidade #h(0.4em) · #h(0.4em) #trabalho.curso
      ]
    ],
    text(
      size: 9.5pt,
      fill: suave,
    )[#trabalho.local #h(0.4em) · #h(0.4em) #trabalho.ano],
  )

  #v(2.8em)

  #text(size: 23pt)[#trabalho.titulo-doc]
  #v(0.55em)
  #text(size: 12pt, fill: suave, style: "italic")[#trabalho.subtitulo-doc]

  #v(1.4em)
  #line(length: 100%, stroke: fio)
  #v(1em)

  #set par(leading: 0.68em)
  #grid(
    columns: (coluna-rotulos, 1fr),
    align: (right + top, left + top),
    column-gutter: 0.7em,
    row-gutter: 1.05em,

    align(right)[#v(0.15em) #rotulo(if trabalho.autores.len() > 1 {
        "Alunos"
      } else { "Aluno" })],
    text(size: 10.5pt)[#trabalho.autores.join(linebreak())],

    align(right)[#v(0.15em) #rotulo("Orientação")],
    text(size: 10.5pt)[#trabalho.orientador],
  )

  #v(1em)
  #line(length: 100%, stroke: fio)
]

#if apresentacao != none {
  block(above: 1.5em, width: 100%)[
    #colunas([], text(size: 10.5pt, fill: suave)[#apresentacao])
  ]
}

= Palavras-chave

#if nota-palavras != none {
  block(below: 1.3em, sticky: true)[#colunas([], nota-palavras)]
}

#block(width: 100%)[
  #set par(justify: false, leading: 0.8em)
  #colunas(
    [],
    grid(
      columns: 1,
      row-gutter: 0.7em,
      ..palavras-chave.map(termo => text(size: 11.5pt)[#termo]),
    ),
  )
]

= Strings de busca

#if nota-buscas != none {
  block(below: 1.5em, sticky: true)[#colunas([], nota-buscas)]
}

#for (n, s) in buscas.enumerate(start: 1) {
  block(width: 100%, above: 0.9em, below: 0.9em, breakable: false)[
    #colunas(
      [#v(7pt) #numero(n)],
      block(width: 100%, fill: painel, radius: 2pt, inset: (x: 10pt, y: 8pt))[
        #set par(justify: false, leading: 0.85em)
        #text(font: mono, size: 8.8pt)[#s]
      ],
    )
  ]
}

#pagebreak(weak: true)

= Referências comentadas

#let justificativa-de(j) = block(above: 0.95em, width: 100%)[
  #set par(justify: true, leading: 0.74em)
  #text(size: 10pt)[
    #rotulo("Justificativa") #h(0.6em)
    #if j == none or j == [] {
      text(style: "italic", fill: suave)[\[a redigir\]]
    } else { j }
  ]
]

#{
  let tema-atual = none

  for (n, e) in entradas.enumerate(start: 1) {
    let tema = e.at("tema", default: none)
    if tema != none and tema != tema-atual {
      heading(level: 2, tema)
      tema-atual = tema
    }

    block(width: 100%, above: 1.5em, below: 1.5em)[
      #colunas(
        [#v(0.6pt) #numero(n)],
        [
          #block(breakable: false, sticky: true)[
            #set par(justify: false, leading: 0.72em)
            #text(size: 10.5pt, hyphenate: false)[#cite(
              label(e.chave),
              form: "full",
            )]
          ]
          #justificativa-de(e.at("justificativa", default: none))
        ],
      )
    ]
  }
}

// As citações completas usam esta bibliografia, sem repetir a lista no PDF.
#show bibliography: none
#bibliography(
  "referencias.bib",
  style: "abnt.csl",
  full: true,
)
