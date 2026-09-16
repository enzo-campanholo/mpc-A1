#let entradas = (
  (
    tema: "Modelagem e validação de ISAs",
    chave: "armstrong2019sail",
    justificativa: [O artigo apresenta a linguagem Sail e modelos semânticos para o comportamento sequencial de arquiteturas como ARMv8-A, RISC-V e CHERI-MIPS. Trata-se de um paralelo claro com a nossa proposta, que é construir um modelo semântico para a arquitetura do SM83.],
  ),
  (
    tema: "Modelagem e validação de ISAs",
    chave: "dasgupta2019isa",
    justificativa: [O artigo apresenta uma semântica formal executável das instruções sequenciais de nível de usuário da arquitetura x86-64 Haswell, excluindo as obsoletas. Trata-se de um trabalho análogo ao nosso projeto, embora usemos ferramentas diferentes, com escopo reduzido e hardware mais simples. Pode servir de referência para as estratégias de implementação.],
  ),
  (
    tema: "Modelagem e validação de ISAs",
    chave: "goel2017simulator",
    justificativa: [Em um trabalho sobre o mesmo tema de Dasgupta e colaboradores, os autores constroem um simulador formal executável da ISA x86 em ACL2 e o validam por comparação com um processador físico. É útil como referência de um projeto similar, com escopo e complexidade maiores.],
  ),
  (
    tema: "Modelagem e validação de ISAs",
    chave: "wang2020sparcv8",
    justificativa: [No artigo, os autores documentam o processo de formalização da arquitetura SPARCv8 em Coq, hoje chamado Rocq. Trata-se de um paralelo claro com o nosso objetivo, que é formalizar a arquitetura do SM83. Os autores, contudo, formalizam a arquitetura diretamente em Coq. Planejamos usar o Sail para gerar as definições necessárias para as provas em Rocq, mas o artigo ainda assim é útil como exemplo de formalização de uma arquitetura.],
  ),
  (
    tema: "Modelagem e validação de ISAs",
    chave: "reid2016isa",
    justificativa: [No artigo, Reid, então pesquisador da ARM, descreve um projeto de cinco anos para gerar especificações executáveis das arquiteturas ARMv8-A e ARMv8-M a partir dos mesmos materiais usados na documentação. Essas especificações foram usadas na verificação formal de processadores ARM. O artigo pode nos ajudar a entender como validar especificações executáveis, uma necessidade do nosso projeto.],
  ),
  (
    tema: "Modelagem e validação de ISAs",
    chave: "reid2017guards",
    justificativa: [O artigo aborda um problema central para o nosso projeto: como saber se as especificações usadas nas provas formais estão corretas? No nosso caso, não dispomos de uma especificação formal oficial do SM83. As estratégias de validação apresentadas podem nos ajudar a avaliar se o nosso modelo corresponde ao comportamento do processador.],
  ),
  (
    tema: "Simulação e emulação eficientes",
    chave: "bolztereick2025simulators",
    justificativa: [O artigo apresenta o Pydrofoil, que gera simuladores a partir de modelos em Sail. Nos testes dos autores com RISC-V, a ferramenta obteve uma aceleração superior a 230 vezes em relação ao simulador em C gerado pelo Sail. Como o desempenho é importante para o nosso projeto, podemos considerar essa ferramenta caso o simulador gerado pelo Sail seja lento demais. Esse ganho, porém, não é uma garantia para o SM83.],
  ),
  (
    tema: "Simulação e emulação eficientes",
    chave: "lockhart2015simulators",
    justificativa: [O artigo descreve a criação do Pydgin, uma ferramenta que gera simuladores de instruções com compilação JIT a partir de descrições de arquiteturas. Ainda não sabemos se o desempenho do código gerado pelo Sail será suficiente, mas o artigo pode nos ajudar a identificar melhorias para o simulador ou para o próprio Sail.],
  ),
  (
    tema: "Simulação e emulação eficientes",
    chave: "bellard2005qemu",
    justificativa: [O artigo de Fabrice Bellard descreve a criação do QEMU e sua estratégia de tradução binária dinâmica. Como o propósito final do nosso projeto é a emulação do SM83, é importante entender as estratégias e motivações de um projeto como o QEMU.],
  ),
  (
    tema: "Verificação de código de máquina e compiladores",
    chave: "sammler2022islaris",
    justificativa: [O artigo descreve a ferramenta Islaris, que usa modelos de ISA escritos em Sail para verificar código de máquina. Ela combina a execução simbólica do Isla com provas em Iris e Coq, hoje chamado Rocq. Talvez não tenha aplicação direta ao nosso projeto, mas pode nos ajudar a entender como usar modelos de ISA em provas formais.],
  ),
  (
    tema: "Verificação de código de máquina e compiladores",
    chave: "leroy2009compcert",
    justificativa: [O autor do artigo, Xavier Leroy, é um dos desenvolvedores do CompCert, um compilador de C formalmente verificado. Estamos explorando a possibilidade de usar o CompCert no nosso projeto, mas, mais do que isso, o CompCert é um exemplo de software formalmente verificado que usa Coq, hoje chamado Rocq, uma tecnologia que também usaremos no projeto.],
  ),
  (
    tema: "Verificação de código de máquina e compiladores",
    chave: "leroy2009backend",
    justificativa: [O artigo complementa o anterior. Leroy se aprofunda nos detalhes do back-end do compilador e de suas provas formais. Será útil para entendermos as limitações do CompCert e evitarmos superestimar suas capacidades.],
  ),
  (
    tema: "Geração de testes e testes baseados em propriedades",
    chave: "martignoni2009testing",
    justificativa: [O artigo apresenta uma estratégia de testes para emuladores de CPU baseada em fuzzing e na comparação com processadores físicos. Um dos objetivos do projeto é comparar nosso modelo com outros emuladores e, possivelmente, núcleos implementados em FPGA. O artigo servirá de base para a montagem dos nossos testes automatizados.],
  ),
  (
    tema: "Geração de testes e testes baseados em propriedades",
    chave: "jiang2022instructions",
    justificativa: [O artigo descreve uma ferramenta que encontra diferenças no comportamento de instruções entre emuladores ARM e dispositivos reais. Ela gera testes a partir da execução simbólica da especificação em ASL. Ainda não sabemos se teremos um dispositivo real para testes, mas, caso consigamos, podemos adaptar parte dessa estratégia ao nosso projeto.],
  ),
  (
    tema: "Geração de testes e testes baseados em propriedades",
    chave: "campbell2016instruction",
    justificativa: [No artigo, os autores discutem como modelos de conjuntos de instruções escritos como funções executáveis podem dificultar a análise do comportamento de cada instrução. Eles apresentam um método que combina avaliação e execução simbólicas em HOL4 para extrair regras de comportamento e gerar testes. Isso pode nos auxiliar na construção dos testes automatizados para o nosso modelo.],
  ),
  (
    tema: "Geração de testes e testes baseados em propriedades",
    chave: "paraskevopoulou2015testing",
    justificativa: [No artigo, os autores apresentam uma metodologia para verificar formalmente testes baseados em propriedades, implementada no QuickChick para Coq. Embora não trate de testes de CPU, o trabalho pode nos ajudar a testar propriedades do modelo em Rocq antes de tentar prová-las e a verificar se os testes avaliam as propriedades pretendidas. Os testes complementam as provas, mas não as substituem.],
  ),
  (
    tema: "Redução de casos de teste",
    chave: "regehr2012testing",
    justificativa: [Caso um erro seja detectado durante os testes automatizados, como podemos simplificar o caso que o provoca? Neste artigo, os autores apresentam estratégias para reduzir programas em C que expõem erros de compiladores, preservando a falha. Essas estratégias podem inspirar a redução de sequências de instruções nos nossos testes, o que pode acelerar o diagnóstico dos erros.],
  ),
  (
    tema: "Redução de casos de teste",
    chave: "zeller2002testing",
    justificativa: [Artigo relacionado ao de Regehr e colaboradores que apresenta o _delta debugging_, uma técnica para simplificar entradas que provocam falhas e isolar diferenças entre casos que passam e falham. Pode nos ajudar a diagnosticar as falhas em nossos testes mais rapidamente.],
  ),
  (
    tema: "Oráculos de teste",
    chave: "barr2015oracle",
    justificativa: [O artigo examina o problema do oráculo de testes: como decidir se um resultado está correto? Uma diferença entre dois resultados não indica qual dos dois está correto. Caso encontremos diferenças em relação a outros emuladores ou núcleos, não podemos concluir que o nosso resultado é o correto apenas por vir de um modelo formal. O artigo também explora abordagens para automatizar essa avaliação, que podem ser úteis nos nossos testes.],
  ),
  (
    tema: "Fundamentos da programação funcional",
    chave: "backus1978vonneumann",
    justificativa: [Artigo clássico de Backus sobre como o computador de von Neumann influencia as linguagens de programação convencionais e limita suas possibilidades de composição e raciocínio matemático. Backus argumenta que o "estilo von Neumann" carece de propriedades matemáticas úteis para o raciocínio sobre programas e propõe uma alternativa funcional. O artigo é útil para fundamentar a importância do raciocínio matemático sobre programas na nossa proposta de verificação formal.],
  ),
)
