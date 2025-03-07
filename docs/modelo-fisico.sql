CREATE DATABASE `Agencia_de_Viagens`;

USE `Agencia_de_Viagens`;

CREATE TABLE IF NOT EXISTS `Cliente` (
    `ID_Cliente` int NOT NULL AUTO_INCREMENT,
    `Nome` varchar(100) NOT NULL,
    `Email` varchar(100) NOT NULL UNIQUE,
    `Telefone` varchar(20) NOT NULL,
    `Senha` varchar(255) NOT NULL,
    PRIMARY KEY (`ID_Cliente`)
);

CREATE TABLE IF NOT EXISTS `Reserva` (
    `ID_Reserva` int NOT NULL AUTO_INCREMENT,
    `Data_Reserva` datetime NOT NULL,
    `Status` ENUM('Pendente', 'Confirmada', 'Cancelada') NOT NULL,
    `ID_Cliente` int NOT NULL,
    PRIMARY KEY (`ID_Reserva`)
);

CREATE TABLE IF NOT EXISTS `Pagamento` (
    `ID_Pagamento` int NOT NULL AUTO_INCREMENT,
    `Valor` decimal(10,2) NOT NULL,
    `Metodo` ENUM('Cartão de Crédito', 'Boleto', 'PIX') NOT NULL,
    `Status` ENUM('Aguardando', 'Pago', 'Cancelado') NOT NULL,
    `ID_Reserva` int NOT NULL,
    PRIMARY KEY (`ID_Pagamento`)
);

CREATE TABLE IF NOT EXISTS `Viagem` (
    `ID_Viagem` int NOT NULL AUTO_INCREMENT,
    `Data_Inicio` date NOT NULL,
    `Data_Fim` date NOT NULL,
    `ID_Reserva` int NOT NULL,
    PRIMARY KEY (`ID_Viagem`)
);

CREATE TABLE IF NOT EXISTS `Destino` (
    `ID_Destino` int NOT NULL AUTO_INCREMENT,
    `Nome` varchar(100) NOT NULL,
    `Pais` varchar(50) NOT NULL,
    `Descricao` text NOT NULL,
    PRIMARY KEY (`ID_Destino`)
);

CREATE TABLE IF NOT EXISTS `Viagem_Destino` (
    `ID_Viagem` int NOT NULL,
    `ID_Destino` int NOT NULL,
    PRIMARY KEY (`ID_Viagem`, `ID_Destino`)
);

ALTER TABLE `Reserva` 
ADD CONSTRAINT `Reserva_fk3` FOREIGN KEY (`ID_Cliente`) REFERENCES `Cliente`(`ID_Cliente`);

ALTER TABLE `Pagamento` 
ADD CONSTRAINT `Pagamento_fk4` FOREIGN KEY (`ID_Reserva`) REFERENCES `Reserva`(`ID_Reserva`);

ALTER TABLE `Viagem` 
ADD CONSTRAINT `Viagem_fk3` FOREIGN KEY (`ID_Reserva`) REFERENCES `Reserva`(`ID_Reserva`);

ALTER TABLE `Viagem_Destino` 
ADD CONSTRAINT `Viagem_Destino_fk0` FOREIGN KEY (`ID_Viagem`) REFERENCES `Viagem`(`ID_Viagem`);

ALTER TABLE `Viagem_Destino` 
ADD CONSTRAINT `Viagem_Destino_fk1` FOREIGN KEY (`ID_Destino`) REFERENCES `Destino`(`ID_Destino`);
