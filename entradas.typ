#let entradas = (
  (
    tema: "ADL",
    chave: "10.1145/3290384",
    justificativa: [O artigo apresenta um modelo semântico para os comportamentos sequenciais de arquiteturas como ARM e MIPS. Trata-se de um paralelo claro com a nossa proposta, que é construir um modelo semântico para a arquitetura do SM83.],
  ),
  (
    tema: "ADL",
    chave: "825767",
    justificativa: [O artigo explora a definição de Architecture Description Language (ADL) no contexto de arquiteturas de software, buscando diferenciá-la de outras notações de modelagem e estabelecer claramente seus limites. Como nos propomos a usar Sail para descrever uma arquitetura de conjunto de instruções, o artigo pode nos ajudar a esclarecer as diferenças entre esses usos do termo ADL.],
  ),
  (
    tema: "Métodos formais",
    chave: "10.1145/1538788.1538814",
    justificativa: [O autor do artigo, Xavier Leroy, é um dos desenvolvedores do CompCert, um compilador de C formalmente verificado. Estamos explorando a possibilidade de usar o CompCert no nosso projeto, mas, mais do que isso, o CompCert é um exemplo de software formalmente verificado que usa Coq, hoje chamado Rocq, uma tecnologia que também usaremos no projeto.],
  ),
  (
    tema: "Métodos formais",
    chave: "Leroy2009",
    justificativa: [O artigo complementa o anterior. Leroy se aprofunda nos detalhes do back-end do compilador e de suas provas formais. Será útil para entendermos as limitações do CompCert e evitarmos superestimar suas capacidades.],
  ),
  (
    tema: "Métodos formais",
    chave: "10.1145/359576.359579",
    justificativa: [Artigo clássico de Backus sobre como o computador de von Neumann influencia as linguagens de programação convencionais e limita suas possibilidades de composição e raciocínio matemático. Backus argumenta que o "estilo von Neumann" carece de propriedades matemáticas úteis para o raciocínio sobre programas e propõe uma alternativa funcional. O artigo é útil para fundamentar a importância do raciocínio matemático sobre programas na nossa proposta de verificação formal.],
  ),
  (
    tema: "Métodos formais",
    chave: "WANG2020102371",
    justificativa: [No artigo, os autores documentam o processo de formalização da arquitetura SPARCv8 em Coq, hoje chamado Rocq. Trata-se de um paralelo claro com o nosso objetivo, que é formalizar a arquitetura do SM83. Os autores, contudo, formalizam a arquitetura diretamente em Coq. Planejamos usar o Sail para gerar as definições necessárias para as provas em Rocq, mas o artigo ainda assim é útil como exemplo de formalização de uma arquitetura.],
  ),
)
