CREATE DATABASE IF NOT EXISTS hospital__dados;
USE hospital__dados;

DROP TABLE IF EXISTS especialidade;
CREATE TABLE especialidade(
	id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_especialidade VARCHAR (100) NOT NULL,
    CNPJ VARCHAR(100) NOT NULL 
);

DROP TABLE IF EXISTS medico;
CREATE TABLE medico(
	id_medico INT AUTO_INCREMENT PRIMARY KEY,
	nome_med VARCHAR (100) NOT NULL,
    sexo VARCHAR (45) NOT NULL,
    CPF VARCHAR (20) NOT NULL UNIQUE,
    CRM INT (4) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    id_med_espec INT NOT NULL,
    FOREIGN KEY (id_med_espec) REFERENCES especialidade(id_especialidade) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS convenio;
CREATE TABLE convenio(
	id_convenio INT PRIMARY KEY AUTO_INCREMENT,
    nome_convenio VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS responsavel(
	id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome_responsavel VARCHAR(100) NOT NULL,
    CPF VARCHAR(20) NOT NULL UNIQUE,
    parentesco VARCHAR(20) NOT NULL
);


DROP TABLE IF EXISTS paciente;
CREATE TABLE paciente(
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome_paci VARCHAR (100) NOT NULL,
    sexo VARCHAR (20) NOT NULL,
    RG VARCHAR(20) NOT NULL,
    CPF VARCHAR(20) NOT NULL UNIQUE,
    data_nasc DATE NOT NULL,
    telefone VARCHAR (20) NOT NULL,
    email VARCHAR (100) NOT NULL,
    endereco VARCHAR (255) NOT NULL,
    id_paci_conv INT,
    id_responsavel INT,
    FOREIGN KEY (id_paci_conv) REFERENCES convenio(id_convenio) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS consulta;
CREATE TABLE consulta(
	id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    id_med INT,
    id_paci INT,
    hora VARCHAR(20) NOT NULL,
    valor FLOAT,
    FOREIGN KEY (id_med) REFERENCES medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_paci) REFERENCES paciente(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS receita(
	id_receita INT PRIMARY KEY AUTO_INCREMENT,
    medicamento VARCHAR(255) NOT NULL,
    id_cMedi INT,
    id_pMedi INT,
    id_mMedi INT,
    FOREIGN KEY (id_cMedi) REFERENCES consulta(id_consulta) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_pMedi) REFERENCES paciente(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_mMedi) REFERENCES medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS tipo_quarto(
	id_tipo_quarto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100),
    valor_diaria FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS quarto(
	id_quarto INT PRIMARY KEY AUTO_INCREMENT,
    numero_quarto INT NOT NULL,
    id_tipo INT NOT NULL,
    FOREIGN KEY (id_tipo) REFERENCES tipo_quarto(id_tipo_quarto) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS enfermeiro(
	id_enfermeiro INT PRIMARY KEY AUTO_INCREMENT,
    nome_enfermeiro VARCHAR(100) NOT NULL,
    CPF VARCHAR (20) NOT NULL UNIQUE,
    COREN INT(6) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS internacao(
	id_internacao INT PRIMARY KEY AUTO_INCREMENT,
    procedimento VARCHAR(255) NOT NULL,
    data_entrada DATE NOT NULL,
    data_prev_alta DATE NOT NULL,
    data_alta DATE NOT NULL,
    id_pacIn INT,
    id_medIn INT,
    id_quartoIn INT,
    id_enferUm INT,
    id_enferDois INT,
    FOREIGN KEY (id_pacIn) REFERENCES paciente(id_paciente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_medIn) REFERENCES medico(id_medico) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_quartoIn) REFERENCES quarto(id_quarto) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_enferUm) REFERENCES enfermeiro(id_enfermeiro) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_enferDois) REFERENCES enfermeiro(id_enfermeiro) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE especialidade DROP COLUMN cnpj;

-- Especialidade
INSERT INTO `hospital__dados`.`especialidade` (`nome_especialidade`) VALUES
("Clínico geral"),
("Gastroenterologia"),
("Pediatria"),
("Dermatologia"),
("Ginecologista"),
("Urologista"),
("Neurologista");

-- Medico
INSERT INTO `hospital__dados`.`medico`(`nome_med`,`sexo`,`CPF`,`CRM`,`data_nasc`,`id_med_espec`) VALUES
("Caio Andrade","Masculino","567.935.012-84","3920","1998-04-23",6),
("Fernada Souto","Feminino","649.234.901-24","3915","1990-07-12",1),
("Camila Santana","Feminino","456.967.234-22","4509","1988-03-01",3),
("Geraldo Ribeiro","Masculino","234.765.322-89","6584","1988-06-30",2),
("Andre Antonelli","Masculino","878.906.325-12","5632","1999-09-12",4),
("Paula Diniz","Feminino","785.094.341-61","6638","2000-02-15",5),
("Andreia Kimura","Feminino","346.453.321-21","1045","1970-03-28",4),
("Daniel Monteiro","Masculino","456.096.325-56","2398","1965-05-03",3),
("Carla Albuquerque","Feminino","767.549.651-09","7654","1985-11-29",7),
("Bruno Cavalcanti","Masculino","581.490.531-77","4167","1976-02-29",2),
("Heitor Cavalieri","Masculino","452.953.060-46","4932","1947-04-08",6),
("Amanda Belo","Feminino","722.580.810-92","6526","1951-01-12",7);

-- Convenio
INSERT INTO `hospital__dados`.`convenio`(`nome_convenio`,`CNPJ`)VALUES
("Saúde Mais","30.591.510/0001-41"),
("Agil","18.978.822/0001-07"),
("Sul Novaes","71.940.694/0001-95"),
("Porta Segura","14.225.407/0001-21");

-- Responsavel
INSERT INTO `hospital__dados`.`responsavel`(`nome_responsavel`,`CPF`,`parentesco`) VALUES
("Carlos Costa","596.756.020-31", "Pai"),
("Sara Andrade","102.182.760-60", "Mãe"),
("Fernanda Nascimento","521.021.380-38", "Filha"),
("Daniel Campos","840.995.980-12", "Sobrinho");

-- Paciente 
INSERT INTO `hospital__dados`.`paciente`(`nome_paci`,`sexo`,`RG`,`CPF`,`data_nasc`,`telefone`,`email`,`endereco`,`id_paci_conv`,`id_responsavel`) VALUES
("Erica Gusmão","Femino","42.109.856-3","698.213.094-23","1989-03-21","(11)99438-0321","erica23@g.com","R Falcão Nero 28", NULL,NULL),
("Gustavo Dias","Masculino","72.187.856-2","398.215.004-29","1999-12-05","(11)93458-1236","dias_gu@mail.com","R Vasconcelos Pinho, 344", NULL,NULL),
("Maria Helena Costa","Feminino","98.765.309-5","745.602.218-45","2012-07-08","(11)97643-0841","carlos_costa@g.com","Av Castro Alves, 901", 4,1),
("Mariana Almeida","Feminino","67.489.031-6","854.320.840-41","1981-07-23","(11)94713-9015","mari_mari@g.com","R Canapés 20",2,NULL),
("João Barros","Masculino","36.673.109-4","389.320.417-73","1975-01-09","(11)97542-5128","joaoBarros@mail.com","R Fabio Lima 30",NULL,NULL),
("Alicia Campos","Feminino","24.442.016-6","445.699.660-98","1932-04-03","(11)94567-3890","daniel_prado@mail.com","Av Gurman 739",2,4),
("Eduardo Martins","Masculino","63.321.057-8","216.457.438-99","1970-04-04","(11)97653-2378","martin_edu@g.com","R Vilela Paiva 23", 4,NULL),
("Manoela Melo","Feminino","31.016.082-0","559.403.670-97","1999-12-08","(11)98056-4566","manu_melo@g.com","Av Bruno Caxias 151",NULL,NULL),
("Rafaela Andrade","Feminino","45.657.738-5","405.069.980-02","2016-03-10","(11)90453-3786","fe_nescimento@mail.com","R Tiago Hernandes 43",3,2),
("Nicole Mendes","Feminino","39.916.469-8","649.521.930-04","1979-05-23","(11)945802-2675","nicole2000@mail.com","R Bruno Pimntel 220",1,NULL),
("Cauã Moreira","Masculino","26.996.744-8","400.880.000-01","2000-09-26","(11)98766-3864","moreira.c@g.com","R Victor Santos 1025",NULL,NULL),
("Otavio Nascimento","Masculino","26.373.725-1","847.571.940-64","2002-08-11","(11)98061-3411","fe_nescimento@mail.com","R Fabio Bandeirantes 14",1,3),
("Sophia Oliveira","Feminino","42.738.833-8","065.984.880-52","1987-04-20","(11)97760-7124","sophia.o@g.com","R Fragoso Pinto 33",NULL,NULL),
("Miguel Nunes","Masculino","29.015.152-1","620.382.260-40","1967-12-05","(11)97843-3895","miguel34@g.com","R Ines Pontes 66",NULL,NULL),
("José Rocha","Masculino","45.796.611-7","913.326.560-72","1955-08-25","(11)97644-3766","rocha_jose@mail.com","R Canapés 72",3,NULL);

-- CONSULTA
INSERT INTO `hospital__dados`.`consulta`(`data_consulta`, `id_med`, `id_paci`, `hora`, `valor`) VALUES 
('2015-03-10', 2, 15, '09:00', 95.00),
('2017-06-22', 5, 6, '10:30', 135.00), 
('2016-01-14', 1, 7, '11:15', 130.00),
('2016-04-28', 4, 4, '14:00', 100.00), 
('2020-08-05', 3, 3, '15:45', 150.00), 
('2018-02-17', 6, 10, '16:30', 130.00), 
('2018-06-30', 11, 7, '08:45', 130.00),
('2015-09-12', 9, 12, '12:00', 200.00), 
('2022-11-25', 8, 9, '13:30', 150.00),  
('2020-05-18', 2, 1, '17:00', 95.00), 
('2020-07-29', 7, 2, '09:30', 135.00), 
('2017-11-08', 10, 8, '10:15', 110.00), 
('2016-12-04', 12, 5, '11:45', 200.00),
('2015-10-20', 2, 11, '14:30', 95.00), 
('2017-01-07', 6, 13, '15:15', 130.00),
('2019-04-11', 1, 14, '16:45', 130.00), 
('2019-10-01', 10, 6, '08:15', 110.00),
('2016-09-26', 2, 7, '12:30', 95.00), 
('2016-02-14', 11, 12, '13:00', 130.00), 
('2021-01-01', 12, 3, '17:30', 130.00);

-- Receita
INSERT INTO `hospital__dados`.`receita`(`medicamento`,`id_cMedi`,`id_pMedi`,`id_mMedi`)VALUES
("Flanax 550mg 2xdia",1,15,2),
("Voltaren 75mg 3xdia",1,15,2),
("Pyridium 200mg 8em8h",3,7,1),
("Tadafila 5mg 1xdia ",3,7,1),
("Acetato de tocoferol 4gotasxdia ",5,3,3),
("Dipirona  500mg/ml 20gotas 12em12h",5,3,3),
("Biotonico 400ml 15ml 2xdia",5,3,3),
("Loratamed 10mg 1xdia",2,6,5),
("Cetaphil passar 2xdia",2,6,5),
("Cloridrato de Naratriptana 2.5mg 1xdia",8,12,9),
("Emgality 100mg/ml C/ 3 SER PREE 1ml",8,12,9),
("Omeprazol 40mg 1xdia",12,8,10),
("Amoxicilina 1.5g 1xdia",12,8,10),
("Trimebutina 200mg 2xdia",18,7,2),
("Maleato de dexclorfeniramina 10mg 6em6h",18,7,2),
("Paracetamol 750mg 2xdia",11,2,7),
("Sulfadiazina de prata 30g 3xdia",11,2,7),
("Novalgina 50mg/ml 20mlxdia ",9,9,8),
("Ampicilina 2g 6em6h ",9,9,8),
("Liris 5mg/ml 2gotas",10,1,2),
("Paracetamol 15mg 4em4h",10,1,2);

-- Tipo quarto
INSERT INTO `hospital__dados`.`tipo_quarto`(`descricao`,`valor_diaria`)VALUES
("Enfermaria", 100),
("Quartos duplos", 120),
("Apartamento", 180);

-- Quarto
INSERT INTO `hospital__dados`.`quarto`(`numero_quarto`,`id_tipo`)VALUES
(33, 1),
(35, 2),
(52, 3);

-- Enfermeiro
INSERT INTO `hospital__dados`.`enfermeiro`(`nome_enfermeiro`,`CPF`,`COREN`)VALUES
("Aline Oliveira","141.369.040-88","290765"),
("Renata Campos","181.756.620-26","346894"),
("Rodrigo Vasconcelos","642.915.220-02","672169"),
("Yago Pereira","933.382.640-89","784302"),
("Gabriel Novaes","206.428.820-10","568125"),
("Carla Lima","295.046.230-85","628795"),
("Catarina Pacheco","809.751.130-46","309628"),
("Carolina Pascole","662.955.160-50","904336"),
("Lucas Modesto","801.322.580-13","180325"),
("Joaquim Mello","611.037.450-42","487120");

-- Internacao
INSERT INTO `hospital__dados`.`internacao`(`procedimento`,`data_entrada`,`data_prev_alta`,`data_alta`,`id_pacIn`,`id_medIn`,`id_quartoIn`,`id_enferUm`,`id_enferDois`)
VALUES
("Lorem Ipsum is simply dummy text", "2015-10-20", "2015-11-2","2015-11-2",12,9,3,1,4),
("Lorem Ipsum is simply dummy text", "2020-10-29", "2020-11-5","2020-11-3",3,3,2,7,10),
("Lorem Ipsum is simply dummy text", "2022-11-30", "2022-12-07","2022-12-15",9,8,2,2,5),
("Lorem Ipsum is simply dummy text", "2016-05-03", "2016-05-20","2016-05-27",11,2,1,6,9),
("Lorem Ipsum is simply dummy text", "2016-05-10", "2016-05-22","2016-05-25",4,4,1,3,8),
("Lorem Ipsum is simply dummy text", "2017-03-15", "2017-05-05","2017-05-06",13,6,1,9,1),
("Lorem Ipsum is simply dummy text", "2016-08-30", "2016-09-05","2016-09-05",12,11,3,4,7),
("Lorem Ipsum is simply dummy text", "2021-01-12", "201-02-15","2021-02-12",3,12,2,6,3);

-- Adicionar coluna
ALTER TABLE medico ADD COLUMN em_atividade VARCHAR(100);

UPDATE medico SET em_atividade = 'ativo' WHERE id_medico BETWEEN 1 AND 10;
UPDATE medico SET em_atividade = 'inativo' WHERE id_medico IN (11, 12);


INSERT INTO `hospital__dados`.`medico`(`nome_med`,`sexo`,`CPF`,`CRM`,`data_nasc`,`id_med_espec`,`em_atividade`) VALUES
("Paloma Fernandes","Feminino","530.519.660-45","8331","1971-03-12",7,"ativo"),
("Gabriel Azevedo","Masculino","555.266.900-24","9944","1989-10-08",3,"ativo"),
("Daniela Coelho","Feminino","489.734.910-91","2245","1959-01-22",1,"inativo"),
("Gabriel D'avila","Masculino","712.272.760-28","0092","2000-12-04",6,"ativo");


-- Consultas de 2020 e que foram feitas sob o convenio
SELECT
    paciente.id_paciente,
    paciente.nome_paci,
	paciente.id_paci_conv,
    medico.id_medico,
    medico.nome_med,
    consulta.id_consulta,
    consulta.data_consulta,
    consulta.valor
FROM
    consulta 
JOIN paciente ON paciente.id_paciente = consulta.id_paci
JOIN medico ON consulta.id_med = medico.id_medico
JOIN convenio  
WHERE
    YEAR(consulta.data_consulta) = 2020;


--  Internações que tiveram data de alta maior que a data prevista
SELECT * FROM internacao
WHERE data_alta > data_prev_alta;


-- Receituário da primeira consulta registrada
SELECT *FROM receita
WHERE id_cMedi = 1;


-- Dados do maior e menor valor da consulta e não podem ser realizadas pelo convenio
(
    SELECT * FROM consulta
    WHERE id_paci NOT IN (SELECT id_paciente FROM paciente WHERE id_paci_conv IS NOT NULL)
    ORDER BY valor DESC
    LIMIT 1
)
UNION
(
    SELECT *
    FROM consulta
    WHERE id_paci NOT IN (SELECT id_paciente FROM paciente WHERE id_paci_conv IS NOT NULL)
    ORDER BY valor
    LIMIT 1
);


-- Todas as internações em seus quartos, calculando o total da internação de acordo com a diária e número de dias internados
SELECT internacao.id_internacao, internacao.procedimento, internacao.data_entrada, internacao.data_alta, 
       quarto.numero_quarto, tipo_quarto.valor_diaria,
       DATEDIFF(internacao.data_alta, internacao.data_entrada) AS dias_internados,
       DATEDIFF(internacao.data_alta, internacao.data_entrada) * tipo_quarto.valor_diaria AS custo_total
FROM internacao 
JOIN quarto ON internacao.id_quartoIn = quarto.id_quarto
JOIN tipo_quarto ON quarto.id_tipo = tipo_quarto.id_tipo_quarto
ORDER BY custo_total;
-- DATEDIFF é uma função em que calcula a diferença entre duas datas


-- Data, procedimento e número de quarto de internações em quartos do tipo apartamento
SELECT internacao.data_entrada, internacao.procedimento, quarto.numero_quarto
FROM internacao
INNER JOIN quarto ON internacao.id_quartoIn = quarto.id_quarto
INNER JOIN tipo_quarto ON quarto.id_tipo = tipo_quarto.id_tipo_quarto
WHERE tipo_quarto.descricao = 'apartamento';


-- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos cuja especialidade não seja “pediatria”
SELECT paciente.nome_paci, consulta.data_consulta, especialidade.nome_especialidade
FROM paciente
JOIN consulta ON paciente.id_paciente = consulta.id_paci
JOIN medico ON consulta.id_med = medico.id_medico
JOIN especialidade ON medico.id_med_espec = especialidade.id_especialidade
WHERE paciente.data_nasc > DATE_SUB(CURDATE(), INTERVAL 18 YEAR)
AND especialidade.nome_especialidade != 'Pediatria' -- Diferente
ORDER BY consulta.data_consulta;
-- A função DATE_SUB para obter a data há 18 anos a partir da data atual.
-- O CURDATE() fornece a data atual.
-- O INTERVAL 18 YEAR subtrai 18 anos dessa data atual.
-- Isso resulta na data há exatamente 18 anos antes da data atual.


-- Paciente, médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
SELECT paciente.nome_paci, medico.nome_med, internacao.data_entrada, internacao.procedimento
FROM paciente
INNER JOIN internacao ON paciente.id_paciente = internacao.id_pacIn
INNER JOIN medico ON internacao.id_medIn = medico.id_medico
INNER JOIN especialidade ON medico.id_med_espec = especialidade.id_especialidade
INNER JOIN quarto ON internacao.id_quartoIn = quarto.id_quarto
INNER JOIN tipo_quarto ON quarto.id_tipo = tipo_quarto.id_tipo_quarto
WHERE especialidade.nome_especialidade = 'Gastroenterologia'
AND tipo_quarto.descricao = 'Enfermaria';

-- Os médicos, seus CRMs e a quantidade de consultas que cada um realizou.
SELECT medico.nome_med, medico.CRM, COUNT(consulta.id_consulta) AS total_consultas
FROM medico
LEFT JOIN consulta ON medico.id_medico = consulta.id_med
GROUP BY medico.id_medico;
-- O uso do LEFT JOIN assegura que todos os médicos sejam listados, mesmo que não tenham consultas registradas.
-- Resultado da função COUNT(consulta.id_consulta), que irá contar o número de ocorrências na tabela consulta para cada médico. 
-- O resultado será denominado de total_consultas.
-- O GROUP BY é responsável por criar grupos separados para cada valor único de id_medico. 
-- Isso significa que todas as consultas associadas ao mesmo médico serão agregadas juntas.


-- Todos os médicos que tenham "Gabriel" no nome. 
SELECT * FROM medico
WHERE nome_med LIKE '%Gabriel%';

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT enfermeiro.nome_enfermeiro, enfermeiro.CPF, enfermeiro.COREN, COUNT(internacao.id_internacao) AS numero_internacoes
FROM enfermeiro
JOIN internacao ON enfermeiro.id_enfermeiro = internacao.id_enferUm OR enfermeiro.id_enfermeiro = internacao.id_enferDois
GROUP BY enfermeiro.id_enfermeiro
HAVING COUNT(internacao.id_internacao) > 1;
-- O HAVING COUNT(i.id_internacao) > 1 é uma cláusula que filtra o resultado para mostrar apenas os enfermeiros que participaram de mais de uma internação. 
-- Isso é alcançado contando o número de internações para cada enfermeiro e selecionando apenas aqueles com mais de uma internação.
