-- Script de criação
-- DDL
drop database IF EXISTS mydb;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ENDERECO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ENDERECO` (
  `rua` VARCHAR(45) NULL,
  `numero` INT NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `id_end` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_end`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PACIENTE` (
  `idPaciente` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `ENDERECO_id_end` INT NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_PACIENTE_ENDERECO1_idx` (`ENDERECO_id_end` ASC),
  CONSTRAINT `fk_PACIENTE_ENDERECO1`
    FOREIGN KEY (`ENDERECO_id_end`)
    REFERENCES `mydb`.`ENDERECO` (`id_end`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MEDICO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MEDICO` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`QUADRO_HORARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`QUADRO_HORARIO` (
  `dia_hora` DATETIME(5) NOT NULL,
  `disponivel` TINYINT(1) NULL DEFAULT true,
  `confirmacao` TINYINT(1) NULL DEFAULT false,
  `MEDICO_id_medico` INT NOT NULL,
  PRIMARY KEY (`dia_hora`, `MEDICO_id_medico`),
  INDEX `fk_QUADRO_HORARIO_MEDICO1_idx` (`MEDICO_id_medico` ASC),
  CONSTRAINT `fk_QUADRO_HORARIO_MEDICO1`
    FOREIGN KEY (`MEDICO_id_medico`)
    REFERENCES `mydb`.`MEDICO` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PLANO_SAUDE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PLANO_SAUDE` (
  `id_plano` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_plano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONSULTA` (
  `idPaciente` INT NOT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia_hora` DATETIME(5) NOT NULL,
  `id_medico` INT NOT NULL,
  `diagnostico` VARCHAR(45) NULL,
  `receita` VARCHAR(45) NULL,
  `retorno` VARCHAR(45) NULL,
  `PLANO_SAUDE_id_plano` INT NOT NULL,
  `motivo_consulta` VARCHAR(45) NULL,
  INDEX `fk_CONSULTA_PACIENTE1_idx` (`idPaciente` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_CONSULTA_QUADRO_HORARIO1_idx` (`dia_hora` ASC, `id_medico` ASC),
  INDEX `fk_CONSULTA_PLANO_SAUDE1_idx` (`PLANO_SAUDE_id_plano` ASC),
  CONSTRAINT `fk_CONSULTA_PACIENTE1`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `mydb`.`PACIENTE` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_QUADRO_HORARIO1`
    FOREIGN KEY (`dia_hora`)
    REFERENCES `mydb`.`QUADRO_HORARIO` (`dia_hora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_PLANO_SAUDE1`
    FOREIGN KEY (`PLANO_SAUDE_id_plano`)
    REFERENCES `mydb`.`PLANO_SAUDE` (`id_plano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TELEFONE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TELEFONE` (
  `numero` INT NOT NULL,
  `idPaciente` INT NOT NULL,
  INDEX `fk_TELEFONE_PACIENTE_idx` (`idPaciente` ASC),
  CONSTRAINT `fk_TELEFONE_PACIENTE`
    FOREIGN KEY (`idPaciente`)
    REFERENCES `mydb`.`PACIENTE` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;