DBA - Data Base Administrator



Banco de dados relacional - 



SQL - Structured Querry Language





MySQL - Utiliza-se a linguagem SQL para manipulação do grande volume de dados	











##### \[Aula 02 19/02 Conceitos de Banco de dados]







**DB/BD:** É uma coleção logicamente coerente dos dados com determinada siginificação intrínseca, com a finalidade é o armazenamento organizado de informações, otimizando sistemas facilitando entradas, alterações, processamento e consulta de dados. Para sua criação e manutenção, utiliza-se SGDB.  O conjunto formado por BD + Aplicações que o manipulam é chamado Sistema de Banco de dados.



Principais características do SGDB



**-Integridade:** Impedir que um determinado código ou chave de uma tabela 'Histórico escolar' Sem sua descrição na tabela 'Disciplina'.



**Restrição ou Consistência**

Armazenamento de informações Centralizados, mas com acesso descentralizado. A inconsistência ocorre quando um mesmo campo tem valores diferentes em sistemas diferentes. Quando o armazenamento é centralizado este problema não ocorre.



**Segurança e Privacidade:**



Define para cada usuário o nível de acesso a ele concedido(leitura, leitura e gravação ou S/ Acesso), a uma tabela ou campo específico.



**Restauração ou Reorganização:**

Capacidade de se recuperar de falhas de Hardware e software por meio de arquivos e backup ou outros recursos.













Pesquisa:

Diferenças entre os modelos de BD.





Hierárquico

Modelo de Rede

Modelo Relacionar

Orientado a Objetos

Não Relacional





Definição, Características e diferenças



26/02


Data WareHouse
Armazém de dados modulo dimensional 
Sistema projetado para análise de comportamento e tendências de negócio.
Partem da implantação para a necessidade do usuário idelalizado por Innom/Kimball
A modelagem dimensional é uma técnica de projeto lógico que busca apresentar dados em uma estrutura padronizaad e intuitiva que permite alto desempenho, evitando
técnicas de normalização. Especificamente utilizada para suportar processamento analítico OLAP - On-line Analitic Process O tipo de negócio pode ser representado por um
cubo de dados

- células do cubo = valores
- arestas do cubo = dimensões de dado

é possível representar muitas dimensões, em geral de 4 a 15 Modelos + Dimensões podem ser combinadas 

Projeto de DB:

Dados: Parte mais estável. Após sua definição costuma sofrer pouca atualização.
Processos: parte mais dinâmica os processos realizados sobre os dados variam com a necessidade

Fases do projeto:

Análise de Requisitos:
Coleta informações sobre os dados.

Projeto Conceitual: Procura capturar formalmente os requisitos de informação de BS. Define-se os primcipaisrelacionamentos sem se preocupar com restrições

Descreve informações contidas em uma realidade

Projeto lógico: Definem as estruturas de dados que implementam os requisitos identificados na modelagem conceitual. Resulta em um esquema lógico sob a ótica de uma abordagem (lógica, relacional, rede, etc)

Projeto físico: Define parâmtreos físicos de acesso. Tipos de dados, tamanho de campos, índices, locais de gravação etc..


Cardinalidade:

1:1
1:n
n:1
n:n