-- QUESTÃO 5 (3.0 pontos)
 -- No protótipo de telas do sistema apresentado, faça as consultas, inclusões, alterações e exclusões que estejam de acordo com cada tela apresentada.

-- 				 **********************TELA 1 AGENDAMENTOS**********************

-- Selecionando a agenda de um médico apenas em uma determinada data
SELECT * FROM(select distinct medico.nome as 'Nome médico', 
DATE_FORMAT(quadro_horario.dia_hora, '%H:%i') as 'Data e hora', 
(select paciente.nome from paciente where paciente.idPaciente = consulta.idPaciente)as 'Nome Paciente' ,
CASE quadro_horario.confirmacao   
WHEN  (1) THEN 'Confirmado'
WHEN  (0) THEN ' - '
end as 'Confirmação'	,
plano_saude.nome as 'Tipo da consulta',
consulta.motivo_consulta as 'Descrição',
CASE quadro_horario.disponivel   
WHEN  (1) THEN 'Disponível do médico'
WHEN  (0) THEN 'Ocupado'
end as 'Disponibilidade'
from medico , quadro_horario, consulta,paciente,plano_saude
where quadro_horario.MEDICO_id_medico = medico.id_medico 
	and consulta.id_medico = medico.id_medico	
	and quadro_horario.dia_hora = consulta.dia_hora
	and quadro_horario.dia_hora BETWEEN '2018-04-12 00:00:00' AND '2018-04-12 23:59:59'
	and medico.id_medico = 2
	and consulta.PLANO_SAUDE_id_plano = plano_saude.id_plano
-- order by quadro_horario.dia_hora,
-- and medico.nome like "Art%")
)AS a 
  union -- union all -- union sem distinct 
SELECT * FROM(select distinct medico.nome as 'Nome médico', 
DATE_FORMAT(quadro_horario.dia_hora, '%H:%i') as 'Data e hora' ,
(SELECT IFNULL(NULL, " - ")) as 'Nome Paciente',
CASE quadro_horario.confirmacao   
WHEN  (1) THEN 'Confirmado'
WHEN  (0) THEN ' - '
end as 'Confirmação',
(SELECT IFNULL(NULL, " - ")) as 'Tipo da consulta',
(SELECT IFNULL(NULL, " - ")) as 'Descrição',
CASE quadro_horario.disponivel   
WHEN  (1) THEN 'Disponível'
WHEN  (0) THEN 'Ocupado'
end as 'Disponibilidade do médico'
from medico , quadro_horario, consulta,paciente,plano_saude
where quadro_horario.MEDICO_id_medico = medico.id_medico 
	and quadro_horario.dia_hora BETWEEN '2018-04-12 00:00:00' AND '2018-04-12 23:59:59'
	and medico.id_medico = 2
	and quadro_horario.disponivel = true
-- order by quadro_horario.dia_hora,
-- and medico.nome like "Art%")
)AS b
order by 2 ; 

		
		
-- Incluindo novo paciente para realizar NOVO AGENDAMENTO de consulta
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE						
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua das brasileirinhas',8,'Rolandia');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('71717171717','Vivi Fernandes','25/12/1988',LAST_INSERT_ID(),'F');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(12345678,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));
						
#Selecionando o id do paciente para inserir a consulta; 
select paciente.idPaciente from paciente where paciente.nome like "%Vivi%"	;
								
#Incluindo consulta para a paciente inserida
	INSERT INTO consulta(idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
	VALUES ((select paciente.idPaciente from paciente where paciente.nome like "%Vivi%"),
	'2018-04-12 14:00',2,'Sinusite','Dorflex','15/07/2018',3,'Dores na cabeça');    
#Paciente confirama sua consulta e médico fica com horário na agenda indisponivel ATUALIZANDO..
	update quadro_horario set disponivel =false, confirmacao =true
	where quadro_horario.dia_hora = '2018-04-12 14:00'
		and quadro_horario.MEDICO_id_medico =2 ;
		
#Com base na data de retorno paciente marca uma nova consulta  (criar registro na agenda para poder marcar consulta)			
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-07-15 11:00',2);
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (1,'2018-07-15 11:00',2,'Retorno','Está curado','-',1,'Retorno marcado pelo médico');


-- ATUALIZANDO UM AGENDAMENTO
#Atualizando o retorno da paciente do exemplo acima
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-07-15 12:00',2);
UPDATE consulta SET dia_hora = '2018-07-15 12:00',id_medico= 2 where consulta.idPaciente = (select paciente.idPaciente from paciente where paciente.nome like "%Vivi%");	
DELETE FROM consulta WHERE dia_hora = '2018-07-15 11:00';


-- Chek na agenda para validar as operações acima
-- executar primeiro select novamente


-- ======================================================================================================

-- TELA 2 CONSULTAS parte superior
-- selecionar pacientes com seus atendimentos apresentando a ultima consulta feita
select distinct paciente.nome as 'Nome',
DATE_FORMAT(STR_TO_DATE(paciente.data_nascimento, '%d/%m/%Y'), '%d/%m/%Y ')  as 'Data Nascimento' ,
DATE_FORMAT(max(quadro_horario.dia_hora), '%d/%m/%Y %H:%i') as 'Ultima consulta confirmada', 
DATE_FORMAT((STR_TO_DATE(paciente.data_nascimento, '%d/%m/%Y')), '%d/%m/%Y') AS Nascimento,
TRUNCATE(DATEDIFF(NOW(), (STR_TO_DATE(paciente.data_nascimento, '%d/%m/%Y')))/365.25, 0) AS Idade,
plano_saude.nome as 'Tipo da consulta',
CASE paciente.sexo   
WHEN  ('M') THEN 'Masculino'
WHEN  ('F') THEN 'Feminino'
end as 'Sexo'
from paciente, plano_saude, consulta, quadro_horario, medico
where paciente.idPaciente = consulta.idPaciente 
and consulta.PLANO_SAUDE_id_plano =plano_saude.id_plano
and quadro_horario.confirmacao = TRUE
and paciente.nome like '%Ander%'
order by paciente.nome;
	 
-- Parte inferior TELA 2
#INFORMAÇÕES DO PACIENTE (botão histórico do paciente)
select distinct paciente.nome as 'Nome',
consulta.motivo_consulta as 'Motivo da consulta',
 consulta.diagnostico as 'Diagnostigo',
  consulta.receita as 'Receita',
  IFNULL( DATE_FORMAT(STR_TO_DATE(consulta.retorno, '%d/%m/%Y'), '%m/%d/%Y '), "Atendimento finalizado") as 'RETORNO',
	DATE_FORMAT(consulta.dia_hora, '%d/%m/%Y/%H:%i')as 'Data da consulta selecionada'
from paciente, consulta, plano_saude
	where paciente.idPaciente = consulta.idPaciente 
		and consulta.PLANO_SAUDE_id_plano =plano_saude.id_plano 
		and paciente.idPaciente =1  -- o id deve ser o capturado por evento de clique na tela acima
		and consulta.dia_hora BETWEEN '2018-06-12 00:00:00' AND '2018-06-12 23:59:59' -- data selecionada através de clique no calendário da tela
	order by consulta.dia_hora;


-- =============================================================================================

-- TELA 3 PACIENTES 
-- parte superior
select paciente.nome as 'Nome' , paciente.cpf as 'CPF'
,DATE_FORMAT((STR_TO_DATE(paciente.data_nascimento, '%d/%m/%Y')), '%d/%m/%Y') AS Nascimento, TRUNCATE(DATEDIFF(NOW(), (STR_TO_DATE(paciente.data_nascimento, '%d/%m/%Y')))/365.25, 0) AS Idade
,paciente.data_nascimento as 'Nascimento', 
CASE paciente.sexo   
WHEN  ('M') THEN 'Masculino'
WHEN  ('F') THEN 'Feminino'
end as 'Sexo',
endereco.rua  as 'Rua', endereco.numero as 'Nº', endereco.bairro as 'Bairro'
,telefone.numero as 'Numero Teleforne'
	from paciente, endereco, telefone 
	where paciente.ENDERECO_id_end =endereco.id_end
		and paciente.idPaciente = telefone.idPaciente
		and paciente.nome like "%luke s%"
		order by paciente.nome;

-- parte inferior TELA 3
#Selecionando ficha do paciente por medico 
#(INSERIR O ID DO MEDICO E DO PACIENTE CONFORME RESULTADO DA QUERY ANTERIOR - parte superior desta tela)
select paciente.nome as 'Paciente nome', medico.nome as 'Nome Médico', 
DATE_FORMAT(consulta.dia_hora, '%d/%m/%Y')as 'Data consulta',
consulta.motivo_consulta as 'Motivo da consulta',
 consulta.diagnostico as 'diagnostico', 
consulta.receita as 'Receita', 
consulta.retorno as 'Retorno'
 from  paciente, consulta, plano_saude,medico 
	where consulta.idPaciente =(SELECT paciente.idPaciente from paciente WHERE paciente.nome like "%Luke s%")
	and consulta.id_medico =2
	and (consulta.id_medico= medico.id_Medico)
	and paciente.idPaciente = consulta.idPaciente 
	and consulta.PLANO_SAUDE_id_plano =plano_saude.id_plano 
	order by paciente.nome;
	
#Selecionando ficha do paciente em uma data especifica	
select paciente.nome as 'Pac iente nome', medico.nome as 'Nome Médico', DATE_FORMAT(consulta.dia_hora, '%d/%m/%Y')as 'Data consulta',consulta.motivo_consulta as 'Motivo da consulta', consulta.diagnostico as 'Diagnostico', consulta.receita as 'Receita', consulta.retorno as 'Retorno'
 from  paciente, consulta, plano_saude,medico 
	where consulta.idPaciente =1
	and consulta.id_medico =1 
	and (consulta.id_medico= medico.id_Medico)
	and paciente.idPaciente = consulta.idPaciente 
	and consulta.PLANO_SAUDE_id_plano =plano_saude.id_plano 
	and DATE_FORMAT(consulta.dia_hora, '%d/%m/%Y') ='03/03/2018'
	order by paciente.nome;

-- =============================================================================


-- QUESTÃO 6 (2.5 pontos)
 -- Faça as seguintes consultas (queries sql)

-- a)	Selecione todos os pacientes do mês de março de 2018
 select paciente.nome ,  MONTH(consulta.dia_hora)as 'MES', DATE_FORMAT(consulta.dia_hora, '%m/%d/%Y %H:%i') as 'Data\\Hora', consulta.id_medico from paciente, consulta 
	where consulta.idPaciente= paciente.idPaciente and   MONTH(consulta.dia_hora) = 3 AND year(consulta.dia_hora) = 2018; 
-- where paciente.idPaciente = consulta.id_medico and  consulta.data_c 

-- b)	Selecione todos os pacientes que tenham nome que começa com ‘Mar’
select paciente.nome from paciente where paciente.nome like "Mar%";

-- c)	Selecione a quantidade de pacientes atendido no mês de abril de 2018
select count(paciente.nome)as 'Quantidade de pacientes' from paciente, consulta 
	where  consulta.idPaciente= paciente.idPaciente and   MONTH(consulta.dia_hora) = 4 AND year(consulta.dia_hora) = 2018;

-- d)	Selecione o nome do paciente e a quantidade que o mesmo foi atendido em 01/04/2018
select  paciente.nome as 'Nome', count(*) as 'Quantidade de atendimentos em abril' from paciente,consulta 
	where paciente.idPaciente = consulta.idPaciente 
		and day(consulta.dia_hora) = 1 AND MONTH(consulta.dia_hora) = 4 and year(consulta.dia_hora) = 2018
	group by paciente.nome ;
        

-- e)	Selecione os horários livres do médico na semana corrente.
-- selecionando todos os médicos e seus horários  na semana correte.
select medico.nome as 'Nome',DATE_FORMAT( quadro_horario.dia_hora, '%m/%d/%Y %H:%i') as 'Data\\Hora',
CASE quadro_horario.disponivel   
WHEN  (1) THEN 'Disponível'
WHEN  (0) THEN 'Ocupado'
end as 'Disponibilidade'
	from medico, quadro_horario 
where medico.id_medico =  quadro_horario.MEDICO_id_medico
and quadro_horario.disponivel = true -- comentar essa linha para exibir todos os horários
and quadro_horario.dia_hora BETWEEN '2018-06-11 00:00:00' AND '2018-06-15 23:59:59';

-- selecionando um médico apenas e seus horários na semana corrente
select medico.nome,DATE_FORMAT( quadro_horario.dia_hora, '%m/%d/%Y %H:%i') as 'Data\\Hora' ,
CASE quadro_horario.disponivel   
WHEN  (1) THEN 'Disponível'
WHEN  (0) THEN '*OCUPADO*'
end as 'Disponibilidade'
	from medico, quadro_horario 
where medico.id_medico =  quadro_horario.MEDICO_id_medico
 -- and quadro_horario.disponivel = true  -- caso queira mostrar apenas os horários disponiveis
and quadro_horario.dia_hora BETWEEN '2018-06-11 00:00:00' AND '2018-06-15 23:59:59'
and medico.id_medico = 2;
