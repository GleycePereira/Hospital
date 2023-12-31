# Hospital
Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.

<h2> PARTE 1</h2>
Um banco de dados de um hospital pode ser estruturado em torno de várias entidades principais, como pacientes, médicos, agendamento de consultas entre outros.
Analise a seguinte descrição e extraia dela os requisitos para o banco de dados:
O hospital necessita de um sistema para sua área clínica que ajude a controlar consultas realizadas. Os médicos podem ser generalistas, especialistas ou residentes e têm seus dados pessoais cadastrados em planilhas digitais. Cada médico pode ter uma ou mais especialidades, que podem ser pediatria, clínica geral, gastroenterologia e dermatologia. Alguns registros antigos ainda estão em formulário de papel, mas será necessário incluir esses dados no novo sistema.

Os pacientes também precisam de cadastro, contendo dados pessoais (nome, data de nascimento, endereço, telefone e e-mail), documentos (CPF e RG) e convênio. Para cada convênio, são registrados nome, CNPJ e tempo de carência.

As consultas também têm sido registradas em planilhas, com data e hora de realização, médico responsável, paciente, valor da consulta ou nome do convênio, com o número da carteira. Também é necessário indicar na consulta qual a especialidade buscada pelo paciente.

Deseja-se ainda informatizar a receita do médico, de maneira que, no encerramento da consulta, ele possa registrar os medicamentos receitados, a quantidade e as instruções de uso. A partir disso, espera-se que o sistema imprima um relatório da receita ao paciente ou permita sua visualização via internet.

![diagrama_conceitual](https://github.com/GleycePereira/Hospital/assets/142240220/f19f620f-915f-4717-bb4d-d2ab2c607179)

<h2>Parte 2</h2>
No hospital, as internações têm sido registradas por meio de formulários eletrônicos que gravam os dados em arquivos. 

Para cada internação, são anotadas a data de entrada, a data prevista de alta e a data efetiva de alta, além da descrição textual dos procedimentos a serem realizados. 

As internações precisam ser vinculadas a quartos, com a numeração e o tipo. 

Também é necessário controlar quais profissionais de enfermaria estarão responsáveis por acompanhar o paciente durante sua internação. Para cada enfermeiro(a), é necessário nome, CPF e registro no conselho de enfermagem (CRE).

Faça a ligação com diagrama desenvolvido, construindo relacionamentos com entidades relacionadas.  

![DiagramaER2 drawio](https://github.com/GleycePereira/Hospital/assets/142240220/8cf6447d-bfcd-4cc2-a6ac-0a6ce0daa746)

Desse modelo já devemos gerar a etapa lógica da nossa modelagem!

![DiagramaLogico_hospital](https://github.com/GleycePereira/Hospital/assets/142240220/90ad88eb-60cd-4494-87e2-7828120e38bd)

<h2>Parte 3</h2>
Crie scripts de povoamento das tabelas desenvolvidas na atividade anterior
Observe as seguintes atividades: 
- Inclua ao menos dez médicos de diferentes especialidades.

- Ao menos sete especialidades (considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).

- Inclua ao menos 15 pacientes.

- Registre 20 consultas de diferentes pacientes e diferentes médicos (alguns pacientes realizam mais que uma consulta). As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais medicamentos.

- Inclua ao menos quatro convênios médicos, associe aos pacientes.

- Criar entidade de relacionamento entre médico e especialidade. 

- Criar Entidade de Relacionamento entre internação e enfermeiro. 

- Criar entidade entre internação e enfermeiro.

- Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez. Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

- Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.

- Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.

- Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado.

  ![Captura de tela 2023-11-08 010744](https://github.com/GleycePereira/Hospital/assets/142240220/075eb31f-060f-4228-888e-25d0e18efc37)

<h2>Parte 4</h2>
Pensando no banco que já foi criado para o Projeto do Hospital, realize algumas alterações nas tabelas e nos dados usando comandos de atualização e exclusão:

- Crie um script que adicione uma coluna “em_atividade” para os médicos, indicando se ele ainda está atuando no hospital ou não. 

- Crie um script para atualizar ao menos dois médicos como inativos e os demais em atividade.

  ![Captura de tela 2023-11-08 010807](https://github.com/GleycePereira/Hospital/assets/142240220/974b90c7-945b-4ce5-995a-a45a925913c8)

  <h2>Parte 5</h2>
  Crie um script e nele inclua consultas que retornem:

- Todos os dados e o valor médio das consultas do ano de 2020 e das que foram feitas sob convênio.
- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
- Receituário completo da primeira consulta registrada com receituário associado.
- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
- Os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.
- Todos os médicos que tenham "Gabriel" no nome. 
- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.


<strong> Observação:</strong> se necessário, inclua novos registros no banco de dados para testar adequadamente. 


  ![Captura de tela 2023-11-08 011450](https://github.com/GleycePereira/Hospital/assets/142240220/1d8a2228-2e92-465c-91e5-99e80c2f4913)
