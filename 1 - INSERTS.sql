-- Script para popular nosso banco 
-- DML

use  mydb;
set autocommit=0;

-- INSERINDO PLANOS DE SAÚDE
START TRANSACTION;

	INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(0,'-','-');	
	
	INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(1,'Convenio','Cooparticipacao');
        
     INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(2,'GoldenCross','Empresarial');
	
    INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(3,'Unimed','Empresarial');
        
     INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(4,'ASSIM','Empresarial');
     
	  INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(5,'ASSIM','Convenio');   
		
		INSERT INTO plano_saude(id_plano ,nome, tipo) 
		VALUES(6,'Particular','Particular');
COMMIT;


-- INSERINDO PACIENTES COM SEUS RESPECTIVOs ENDEREÇOs E TELEFONEs
START TRANSACTION;

-- ENDEREÇO
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua Severiano das Chagas',00001,'Santa Cruz' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
-- PACIENTE
		VALUES('11122233300','Anderson Fereira Canel','15/04/1988',LAST_INSERT_ID(),'M');
-- TELEFONE     
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(975252053,(select idPaciente from paciente 
		where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));
-- TELEFONE	
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(982753139,(select idPaciente from paciente 
		where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

		
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua São José 35','00001','Santa Cruz');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233301','Anthony Taylor','15/04/1988',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(10000000,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));	
						

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE	
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua da Constituição ',00001,'Centro' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233302','Roger Waters','15/04/1933',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(10000001,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));


#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro)
		VALUES ('Avenida República do Chile ',245,'Centro' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233303','Callum Luke','15/06/1963',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(10000002,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Galaxia distante ',999999,'fora da via lactea' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('94654713312','Luke Skywalker','15/06/1983',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(98769-5432,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Galaxia distante ',999991,'fora da via lactea' );
    INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233305','Anakin Skywalker','25/06/1988',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(10000004,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

						
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 	
		VALUES ('Galaxia distante ',999992,'fora da via lactea' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233305','Leia Skywalker','25/01/1988',LAST_INSERT_ID(),'F');
    INSERT INTO telefone  (numero ,  idPaciente) 
		values(10000005,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(idPaciente) FROM paciente)));

						
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Street for Hell  ',666,'Inferno' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233306','Jason Voorhees','13/06/1946',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(66666666,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro ) 
		VALUES ('Street for Hell ',1666,'Inferno' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233307','Freddy Krueger','03/09/1951',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(66666666,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

						
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE	
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Street for Hell ',666,'Inferno');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233308','Anabelle','30/03/1988',LAST_INSERT_ID(),'F');
		INSERT INTO telefone  (numero ,  idPaciente) 
		values(66666666,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));
   

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Belem ',777,'Judeia' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233309','Jesus','25/12/0000',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(7777777,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(idPaciente) FROM paciente)));
 
						
#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua planeta Vegeta',777,'Universo 7' );
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233310','Son Goku','25/12/1944',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(22222222,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));  

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE						
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua planeta Terra',777,'Sistema solar');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233310','Majin Boo','25/12/1944',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(22222222,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));	 	
    
    
    #PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE						
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua da Birosca',8,'Pingadaboa');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('11122233310','Marcio Goró','25/12/1944',LAST_INSERT_ID(),'M');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(22222222,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));

#PACIENTE _ ENDEREÇO_E_NUMERO DE TELEFONE						
	INSERT INTO endereco  (rua,numero, bairro) 
		VALUES ('Rua da 2',10,'Bonsucesso');
	INSERT INTO paciente  (cpf, nome, data_nascimento, ENDERECO_id_end,sexo) 
		VALUES('71717171711','Maria Lucia','25/12/1944',LAST_INSERT_ID(),'F');
	INSERT INTO telefone  (numero ,  idPaciente) 
		values(22222222,(select idPaciente from paciente 
						where idPaciente= (SELECT MAX(p.idPaciente) FROM paciente as p)));	

    COMMIT;

	
	
	
-- INSERINDO OS MEDICOS JUNTAMENTE COM SUAS AGENDAS COM ALGUNS HORÁRIOS SIMULADOS
-- CONFIRMAÇÃO E DISPONIBILIDADE SÃO DEFAULT RESPECTIVAMENTE FALSE E TRUE
START TRANSACTION;

	INSERT INTO medico (id_medico,nome, especialidade) 
		VALUES(1,' Arthur Schopenhauer','Proctologista'); 
		INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-03-03 12:00',1),
		('2018-03-03 13:00',1),
		('2018-03-03 14:00',1),
		('2018-01-15 11:00',1),
        ('2018-02-15 11:00',1),
        ('2018-03-15 12:00',1),
        ('2018-03-15 11:00',1),
        ('2018-03-10 11:00',1),
		('2018-04-01 11:00',1),
        ('2018-01-10 10:00',1),
        ('2018-02-10 11:00',1),
        ('2018-03-10 12:00',1),
        ('2018-04-01 12:00',1),
        ('2018-04-01 13:00',1),
		('2018-04-03 12:00',1),
        ('2018-04-04 13:00',1),
        ('2018-04-04 14:00',1),
        ('2018-04-04 15:00',1),
        ('2018-04-04 16:00',1),
        ('2018-04-04 17:00',1),
        ('2018-04-04 18:00',1),
        ('2018-04-05 10:00',1),
        ('2018-04-05 11:00',1),
        ('2018-04-05 12:00',1),
        ('2018-04-05 13:00',1),
        ('2018-04-05 14:00',1),
        ('2018-04-05 15:00',1),
        ('2018-04-05 16:00',1),
        ('2018-04-05 17:00',1),
        ('2018-04-05 18:00',1),
        ('2018-04-06 11:00',1);
        
    INSERT INTO medico (id_medico,nome, especialidade) 
		VALUES(2,' Raul Seixas','Psiquiatra');
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-03-03 12:00',2),
		('2018-03-03 13:00',2),
		('2018-03-03 14:00',2),
		('2018-01-15 11:00',2),
        ('2018-02-15 11:00',2),
        ('2018-03-15 12:00',2),
        ('2018-03-15 11:00',2),
        ('2018-03-10 11:00',2),
		('2018-04-01 11:00',2),
        ('2018-01-10 10:00',2),
        ('2018-02-10 11:00',2),
        ('2018-03-10 12:00',2),
        ('2018-04-01 12:00',2),
        ('2018-04-01 13:00',2),
        ('2018-04-04 13:00',2),
        ('2018-04-04 14:00',2),
        ('2018-04-04 15:00',2),
        ('2018-04-04 16:00',2),
        ('2018-04-04 17:00',2),
        ('2018-04-04 18:00',2),
        ('2018-04-05 10:00',2),
        ('2018-04-05 11:00',2),
        ('2018-04-05 12:00',2),
        ('2018-04-05 13:00',2),
        ('2018-04-05 14:00',2),
        ('2018-04-05 15:00',2),
        ('2018-04-05 16:00',2),
        ('2018-04-05 17:00',2),
        ('2018-04-05 18:00',2),
        ('2018-04-06 11:00',2);
        
    INSERT INTO medico (id_medico,nome, especialidade) 
		VALUES(3,' Thaikovic','Pediatra');  
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-03-03 12:00',3),
		('2018-03-03 13:00',3),
		('2018-03-03 14:00',3),
		('2018-01-15 11:00',3),
        ('2018-02-15 11:00',3),
        ('2018-03-15 12:00',3),
        ('2018-03-15 11:00',3),
        ('2018-03-10 11:00',3),
		('2018-04-01 11:00',3),
        ('2018-01-10 10:00',3),
        ('2018-02-10 11:00',3),
        ('2018-03-10 12:00',3),
        ('2018-04-01 12:00',3),
        ('2018-04-01 13:00',3),
        ('2018-04-04 13:00',3),
        ('2018-04-04 14:00',3),
        ('2018-04-04 15:00',3),
        ('2018-04-04 16:00',3),
        ('2018-04-04 17:00',3),
        ('2018-04-04 18:00',3),
        ('2018-04-05 10:00',3),
        ('2018-04-05 11:00',3),
        ('2018-04-05 12:00',3),
        ('2018-04-05 13:00',3),
        ('2018-04-05 14:00',3),
        ('2018-04-05 15:00',3),
        ('2018-04-05 16:00',3),
        ('2018-04-05 17:00',3),
        ('2018-04-05 18:00',3),
        ('2018-04-06 11:00',3);
    
    
    INSERT INTO medico  ( id_medico, nome, especialidade) 
		VALUES(4,'Frédéric Chopin','geriatra');
			INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-03-03 12:00',4),
		('2018-03-03 13:00',4),
		('2018-03-03 14:00',4),
		('2018-01-15 11:00',4),
        ('2018-02-15 11:00',4),
        ('2018-03-15 12:00',4),
        ('2018-03-15 11:00',4),
        ('2018-03-10 11:00',4),
		('2018-04-01 11:00',4),
        ('2018-01-10 10:00',4),
        ('2018-02-10 11:00',4),
        ('2018-03-10 12:00',4),
        ('2018-04-01 12:00',4),
        ('2018-04-01 13:00',4),
        ('2018-04-04 13:00',4),
        ('2018-04-04 14:00',4),
        ('2018-04-04 15:00',4),
        ('2018-04-04 16:00',4),
        ('2018-04-04 17:00',4),
        ('2018-04-04 18:00',4),
        ('2018-04-05 10:00',4),
        ('2018-04-05 11:00',4),
        ('2018-04-05 12:00',4),
        ('2018-04-05 13:00',4),
        ('2018-04-05 14:00',4),
        ('2018-04-05 15:00',4),
        ('2018-04-05 16:00',4),
        ('2018-04-05 17:00',4),
        ('2018-04-05 18:00',4),
        ('2018-04-06 11:00',4);


	INSERT INTO medico  ( id_medico,nome, especialidade) 
		VALUES(5,'Friedrich engels','Ginecologista');
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-01-15 11:00',5),
        ('2018-02-15 11:00',5),
        ('2018-03-15 12:00',5),
        ('2018-03-15 11:00',5),
        ('2018-03-10 11:00',5),
		('2018-04-01 11:00',5),
        ('2018-01-10 10:00',5),
        ('2018-02-10 11:00',5),
        ('2018-03-10 12:00',5),
        ('2018-04-01 12:00',5),
        ('2018-04-01 13:00',5),
        ('2018-04-04 13:00',5),
        ('2018-04-04 14:00',5),
        ('2018-04-04 15:00',5),
        ('2018-04-04 16:00',5),
        ('2018-04-04 17:00',5),
        ('2018-04-04 18:00',5),
        ('2018-04-05 10:00',5),
        ('2018-04-05 11:00',5),
        ('2018-04-05 12:00',5),
        ('2018-04-05 13:00',5),
        ('2018-04-05 14:00',5),
        ('2018-04-05 15:00',5),
        ('2018-04-05 16:00',5),
        ('2018-04-05 17:00',5),
        ('2018-04-05 18:00',5),
        ('2018-04-06 11:00',5);
	
    INSERT INTO medico  ( id_medico,nome, especialidade) 
		VALUES(6,'Antonio Vivaldi','Ginecologista');
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-01-15 11:00',6),
        ('2018-02-15 11:00',6),
        ('2018-03-15 12:00',6),
        ('2018-03-15 11:00',6),
        ('2018-03-10 11:00',6),
		('2018-04-01 11:00',6),
        ('2018-01-10 10:00',6),
        ('2018-02-10 11:00',6),
        ('2018-03-10 12:00',6),
        ('2018-04-01 12:00',6),
        ('2018-04-01 13:00',6),
        ('2018-04-04 13:00',6),
        ('2018-04-04 14:00',6),
        ('2018-04-04 15:00',6),
        ('2018-04-04 16:00',6),
        ('2018-04-04 17:00',6),
        ('2018-04-04 18:00',6),
        ('2018-04-05 10:00',6),
        ('2018-04-05 11:00',6),
        ('2018-04-05 12:00',6),
        ('2018-04-05 13:00',6),
        ('2018-04-05 14:00',6),
        ('2018-04-05 15:00',6),
        ('2018-04-05 16:00',6),
        ('2018-04-05 17:00',6),
        ('2018-04-05 18:00',6),
        ('2018-04-06 11:00',6);
    
    INSERT INTO medico (id_medico,nome, especialidade) 
		VALUES(7,'Josef Stallin','Cardiologista');    
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-01-15 11:00',7),
        ('2018-02-15 11:00',7),
        ('2018-03-15 12:00',7),
        ('2018-03-15 11:00',7),
        ('2018-03-10 11:00',7),
		('2018-04-01 11:00',7),
        ('2018-01-10 10:00',7),
        ('2018-02-10 11:00',7),
        ('2018-03-10 12:00',7),
        ('2018-04-01 12:00',7),
        ('2018-04-01 13:00',7),
        ('2018-04-04 13:00',7),
        ('2018-04-04 14:00',7),
        ('2018-04-04 15:00',7),
        ('2018-04-04 16:00',7),
        ('2018-04-04 17:00',7),
        ('2018-04-04 18:00',7),
        ('2018-04-05 10:00',7),
        ('2018-04-05 11:00',7),
        ('2018-04-05 12:00',7),
        ('2018-04-05 13:00',7),
        ('2018-04-05 14:00',7),
        ('2018-04-05 15:00',7),
        ('2018-04-05 16:00',7),
        ('2018-04-05 17:00',7),
        ('2018-04-05 18:00',7),
        ('2018-04-06 11:00',7);
	
	INSERT INTO medico  (id_medico, nome, especialidade) 
		VALUES(8,'Karl Marx','Oncologista');  
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-01-15 11:00',8),
        ('2018-02-15 11:00',8),
        ('2018-03-15 12:00',8),
        ('2018-03-15 11:00',8),
        ('2018-03-10 11:00',8),
		('2018-04-01 11:00',8),
        ('2018-01-10 10:00',8),
        ('2018-02-10 11:00',8),
        ('2018-03-10 12:00',8),
        ('2018-04-01 12:00',8),
        ('2018-04-01 13:00',8),
        ('2018-04-04 13:00',8),
        ('2018-04-04 14:00',8),
        ('2018-04-04 15:00',8),
        ('2018-04-04 16:00',8),
        ('2018-04-04 17:00',8),
        ('2018-04-04 18:00',8),
        ('2018-04-05 10:00',8),
        ('2018-04-05 11:00',8),
        ('2018-04-05 12:00',8),
        ('2018-04-05 13:00',8),
        ('2018-04-05 14:00',8),
        ('2018-04-05 15:00',8),
        ('2018-04-05 16:00',8),
        ('2018-04-05 17:00',8),
        ('2018-04-05 18:00',8),
        ('2018-04-06 11:00',8);
        
     INSERT INTO medico  (id_medico, nome, especialidade) 
		VALUES(9,'Freud','Psiquiatra');
INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-01-15 11:00',9),
        ('2018-02-15 11:00',9),
        ('2018-03-15 12:00',9),
        ('2018-03-15 11:00',9),
        ('2018-03-10 11:00',9),
		('2018-04-01 11:00',9),
        ('2018-01-10 10:00',9),
        ('2018-02-10 11:00',9),
        ('2018-03-10 12:00',9),
        ('2018-04-01 12:00',9),
        ('2018-04-01 13:00',9),
        ('2018-04-04 13:00',9),
        ('2018-04-04 14:00',9),
        ('2018-04-04 15:00',9),
        ('2018-04-04 16:00',9),
        ('2018-04-04 17:00',9),
        ('2018-04-04 18:00',9),
        ('2018-04-05 10:00',9),
        ('2018-04-05 11:00',9),
        ('2018-04-05 12:00',9),
        ('2018-04-05 13:00',9),
        ('2018-04-05 14:00',9),
        ('2018-04-05 15:00',9),
        ('2018-04-05 16:00',9),
        ('2018-04-05 17:00',9),
        ('2018-04-05 18:00',9),
        ('2018-04-06 11:00',9);
    
COMMIT;





-- INSERINDO CONSULTAS
START transaction;

-- CONSULTA
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (1,'2018-03-03 12:00',1,'Estresse','Relaxar','15/07/2018',6,'Relata dores de cabeça contanstes');
-- Paciente confirama sua consulta e médico fica com horário na agenda indisponivel ATUALIZANDO..
		update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =1 ;
-- Com base na data de retorno paciente marca uma nova consulta			
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-07-15 11:00',1);
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (1,'2018-07-15 11:00',1,'Retorno','-','Finalizado',6,'Retorno marcado pelo médico');
-- Obs consulta ainda não confirmada		
	/*update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =1 ;
*/

			
-- CONSULTA
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (1,'2018-04-03 12:00',1,'Dor de barriga','Hemosec','15/07/2018',6,'Dor na barriga');
-- Paciente confirama sua consulta e médico fica com horário na agenda indisponivel ATUALIZANDO..
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-03 12:00'
			and quadro_horario.MEDICO_id_medico =1 ;
-- Com base na data de retorno paciente marca uma nova consulta			
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-07-15 12:00',1);
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (1,'2018-07-15 12:00',1,'Retorno','-','Finalizado',6,'Retorno marcado pelo médico');
-- Obs consulta ainda não confirmada		
	/*update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =1 ;
*/

		
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (2,'2018-03-03 12:00',2,'Estresse','Relaxar','01/06/2018',1,'Dor de cabeça');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =2 ;
	-- Com base na data de retorno paciente marca uma nova consulta			
	INSERT INTO quadro_horario( dia_hora, MEDICO_id_medico)
		VALUES('2018-06-01 12:00',2);
	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (2,'2018-06-01 12:00',2,'Retorno','Está curado','-',1,'Retorno marcado pelo médico');
		

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (3,'2018-01-15 11:00',3,'Sinusite','Dorflex','01/06/2018',2,'Dores na cabeça');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-01-15 11:00'
			and quadro_horario.MEDICO_id_medico =3 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (4,'2018-01-15 11:00',4,'Sinusite','Dorflex','01/06/2018',3,'Dores na cabeça');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-01-15 11:00'
			and quadro_horario.MEDICO_id_medico =4 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (5,'2018-04-01 11:00',5,'Diarreia','Plasil','04/06/2018',2,'Dores na barriga');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-01 11:00'
			and quadro_horario.MEDICO_id_medico =5 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (6,'2018-04-01 11:00',6,'Amputação','Implantação de pernas e braços roboticos','05/06/2018',4,'Ferimento nos braços e pernas');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-01 11:00'
			and quadro_horario.MEDICO_id_medico =6 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (7,'2018-04-01 11:00',7,'Estado critico','Camara de regeneração','06/06/2018',4,'Sufocamento espacial');    
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-01 11:00'
			and quadro_horario.MEDICO_id_medico =7 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (3,'2018-04-01 12:00',1,'-','-','06/06/2018',4,'-'); 
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-01 12:00'
			and quadro_horario.MEDICO_id_medico =3 ;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (3,'2018-04-01 12:00',1,'-','-','06/06/2018',4,'-'); 
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-04-01 12:00'
			and quadro_horario.MEDICO_id_medico =3;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (3,'2018-03-03 12:00',1,'-','-','06/06/2018',4,'-');
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =3;

	INSERT INTO consulta( idPaciente,dia_hora,id_medico,diagnostico, receita, retorno,PLANO_SAUDE_id_plano,motivo_consulta)
		VALUES (4,'2018-03-03 12:00',2,'-','-','06/06/2018',4,'-');
	update quadro_horario set disponivel =false, confirmacao =true
		where quadro_horario.dia_hora = '2018-03-03 12:00'
			and quadro_horario.MEDICO_id_medico =4 ;
		
commit;
