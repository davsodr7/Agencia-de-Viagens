-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Agencia_de_Viagens
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Agencia_de_Viagens` ;

-- -----------------------------------------------------
-- Schema Agencia_de_Viagens
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Agencia_de_Viagens` ;
USE `Agencia_de_Viagens` ;

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Cliente` (
  `ID_Cliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(20) NOT NULL,
  `Senha` VARCHAR(255) NOT NULL,
  UNIQUE INDEX (`Email` ASC) VISIBLE,
  PRIMARY KEY (`ID_Cliente`));

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Reserva` (
  `ID_Reserva` INT NOT NULL AUTO_INCREMENT,
  `Data_Reserva` DATETIME NOT NULL,
  `Status` ENUM('Pendente', 'Confirmada', 'Cancelada') NOT NULL,
  `ID_Cliente` INT NOT NULL,
  PRIMARY KEY (`ID_Reserva`),
  INDEX `Reserva_fk3` (`ID_Cliente` ASC) VISIBLE,
  CONSTRAINT `Reserva_fk3`
    FOREIGN KEY (`ID_Cliente`)
    REFERENCES `Agencia_de_Viagens`.`Cliente` (`ID_Cliente`));

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Pagamento` (
  `ID_Pagamento` INT NOT NULL AUTO_INCREMENT,
  `Valor` DECIMAL(10,2) NOT NULL,
  `Metodo` ENUM('Cartão de Crédito', 'Boleto', 'PIX') NOT NULL,
  `Status` ENUM('Aguardando', 'Pago', 'Cancelado') NOT NULL,
  `ID_Reserva` INT NOT NULL,
  PRIMARY KEY (`ID_Pagamento`),
  INDEX `Pagamento_fk4` (`ID_Reserva` ASC) VISIBLE,
  CONSTRAINT `Pagamento_fk4`
    FOREIGN KEY (`ID_Reserva`)
    REFERENCES `Agencia_de_Viagens`.`Reserva` (`ID_Reserva`));

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Viagem` (
  `ID_Viagem` INT NOT NULL AUTO_INCREMENT,
  `Data_Inicio` DATE NOT NULL,
  `Data_Fim` DATE NOT NULL,
  `ID_Reserva` INT NOT NULL,
  PRIMARY KEY (`ID_Viagem`),
  INDEX `Viagem_fk3` (`ID_Reserva` ASC) VISIBLE,
  CONSTRAINT `Viagem_fk3`
    FOREIGN KEY (`ID_Reserva`)
    REFERENCES `Agencia_de_Viagens`.`Reserva` (`ID_Reserva`));

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Destino` (
  `ID_Destino` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Pais` VARCHAR(50) NOT NULL,
  `Descricao` TEXT NOT NULL,
  PRIMARY KEY (`ID_Destino`));

-- -----------------------------------------------------
-- Table `Agencia_de_Viagens`.`Viagem_Destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Agencia_de_Viagens`.`Viagem_Destino` (
  `ID_Viagem` INT NOT NULL,
  `ID_Destino` INT NOT NULL,
  PRIMARY KEY (`ID_Viagem`, `ID_Destino`),
  INDEX `Viagem_Destino_fk1` (`ID_Destino` ASC) VISIBLE,
  CONSTRAINT `Viagem_Destino_fk0`
    FOREIGN KEY (`ID_Viagem`)
    REFERENCES `Agencia_de_Viagens`.`Viagem` (`ID_Viagem`),
  CONSTRAINT `Viagem_Destino_fk1`
    FOREIGN KEY (`ID_Destino`)
    REFERENCES `Agencia_de_Viagens`.`Destino` (`ID_Destino`));
