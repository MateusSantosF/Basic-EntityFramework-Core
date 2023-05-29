CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(150) CHARACTER SET utf8mb4 NOT NULL,
    `ProductVersion` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
) CHARACTER SET=utf8mb4;

START TRANSACTION;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    ALTER DATABASE CHARACTER SET utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE TABLE `Clientes` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `Nome` VARCHAR(80) CHARACTER SET utf8mb4 NOT NULL,
        `CEP` CHAR(8) CHARACTER SET utf8mb4 NOT NULL,
        `Telefone` VARCHAR(11) CHARACTER SET utf8mb4 NOT NULL,
        `Cidade` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
        `Estado` longtext CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_Clientes` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE TABLE `Pedidos` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `IniciadoEm` longtext CHARACTER SET utf8mb4 NOT NULL,
        `FinalizadoEm` longtext CHARACTER SET utf8mb4 NOT NULL,
        `TipoFrete` int NOT NULL,
        `Status` int NOT NULL,
        `Observacao` VARCHAR(512) CHARACTER SET utf8mb4 NOT NULL,
        CONSTRAINT `PK_Pedidos` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE TABLE `Produto` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `CodigoDeBarras` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Descricao` longtext CHARACTER SET utf8mb4 NOT NULL,
        `Valor` decimal(65,30) NOT NULL,
        `Tipo` int NOT NULL,
        `Ativo` tinyint(1) NOT NULL,
        CONSTRAINT `PK_Produto` PRIMARY KEY (`Id`)
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE TABLE `PedidoItems` (
        `Id` int NOT NULL AUTO_INCREMENT,
        `PedidoId` int NOT NULL,
        `ProdutoId` int NOT NULL,
        `Quantidade` int NOT NULL DEFAULT 1,
        `Valor` decimal(65,30) NOT NULL,
        `Desconto` decimal(65,30) NOT NULL,
        CONSTRAINT `PK_PedidoItems` PRIMARY KEY (`Id`),
        CONSTRAINT `FK_PedidoItems_Pedidos_PedidoId` FOREIGN KEY (`PedidoId`) REFERENCES `Pedidos` (`Id`) ON DELETE CASCADE,
        CONSTRAINT `FK_PedidoItems_Produto_ProdutoId` FOREIGN KEY (`ProdutoId`) REFERENCES `Produto` (`Id`) ON DELETE CASCADE
    ) CHARACTER SET=utf8mb4;

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE INDEX `IX_PedidoItems_PedidoId` ON `PedidoItems` (`PedidoId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    CREATE INDEX `IX_PedidoItems_ProdutoId` ON `PedidoItems` (`ProdutoId`);

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

DROP PROCEDURE IF EXISTS MigrationsScript;
DELIMITER //
CREATE PROCEDURE MigrationsScript()
BEGIN
    IF NOT EXISTS(SELECT 1 FROM `__EFMigrationsHistory` WHERE `MigrationId` = '20230529153006_FirstMigration') THEN

    INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
    VALUES ('20230529153006_FirstMigration', '7.0.5');

    END IF;
END //
DELIMITER ;
CALL MigrationsScript();
DROP PROCEDURE MigrationsScript;

COMMIT;

