-- MySQL Script generated by MySQL Workbench
-- Mon Apr 13 17:14:26 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eshaku
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eshaku
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eshaku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `eshaku` ;

-- -----------------------------------------------------
-- Table `eshaku`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nom_usuario` VARCHAR(20) NULL DEFAULT NULL,
  `contrasena` VARCHAR(50) NULL DEFAULT NULL,
  `telefono` VARCHAR(10) NULL DEFAULT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `correo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `index_id_nombre` (`id_usuario` ASC, `nom_usuario` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`solicitante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`solicitante` (
  `id_solicitante` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT(255) NULL,
  PRIMARY KEY (`id_solicitante`),
  INDEX `solicitante_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `solicitante_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `eshaku`.`usuario` (`id_usuario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshaku`.`donador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`donador` (
  `id_donador` INT NOT NULL,
  `id_usuario` INT(255) NULL,
  PRIMARY KEY (`id_donador`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `eshaku`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `eshaku`.`mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`mensaje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contenido` VARCHAR(500) NULL DEFAULT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `fecha_creacion` DATE NULL DEFAULT NULL,
  `mensaje_padre` VARCHAR(500) NULL DEFAULT NULL,
  `id_solicitante` INT(255) NULL,
  `id_donador` INT(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `mensaje_solicitante_idx` (`id_solicitante` ASC) VISIBLE,
  INDEX `mensaje_donador_idx` (`id_donador` ASC) VISIBLE,
  CONSTRAINT `mensaje_solicitante`
    FOREIGN KEY (`id_solicitante`)
    REFERENCES `eshaku`.`solicitante` (`id_solicitante`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `mensaje_donador`
    FOREIGN KEY (`id_donador`)
    REFERENCES `eshaku`.`donador` (`id_donador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`mensaje_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`mensaje_log` (
  `user` VARCHAR(100) NULL DEFAULT NULL,
  `action` VARCHAR(100) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL DEFAULT NULL,
  `descr_post` VARCHAR(500) NULL DEFAULT NULL,
  `fecha_publ` DATE NULL DEFAULT NULL,
  `status` TINYINT(1) NULL DEFAULT NULL,
  `id_donador` INT(255) NULL,
  `id_solicitante` INT(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `post_donador_idx` (`id_donador` ASC) VISIBLE,
  CONSTRAINT `post_donador`
    FOREIGN KEY (`id_donador`)
    REFERENCES `eshaku`.`donador` (`id_donador`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `post_solicitante`
    FOREIGN KEY ()
    REFERENCES `eshaku`.`solicitante` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`post_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`post_log` (
  `user` VARCHAR(100) NULL DEFAULT NULL,
  `action` VARCHAR(100) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`prenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`prenda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(20) NULL DEFAULT NULL,
  `imagen` BLOB NULL DEFAULT NULL,
  `descripcion` VARCHAR(100) NULL DEFAULT NULL,
  `estado` VARCHAR(15) NULL DEFAULT NULL,
  `talla` VARCHAR(10) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `id_post` INT(255) NULL,
  PRIMARY KEY (`id`),
  INDEX `prenda_post_idx` (`id_post` ASC) VISIBLE,
  CONSTRAINT `prenda_post`
    FOREIGN KEY (`id_post`)
    REFERENCES `eshaku`.`post` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`prenda_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`prenda_log` (
  `user` VARCHAR(100) NULL DEFAULT NULL,
  `action` VARCHAR(100) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `eshaku`.`usuario_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`usuario_log` (
  `user` VARCHAR(100) NULL DEFAULT NULL,
  `action` VARCHAR(100) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `eshaku` ;

-- -----------------------------------------------------
-- Placeholder table for view `eshaku`.`donadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`donadores` (`id` INT, `nom_usuario` INT, `contrasena` INT, `telefono` INT, `direccion` INT, `correo` INT, `donador` INT, `solicitante` INT);

-- -----------------------------------------------------
-- Placeholder table for view `eshaku`.`v_display_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`v_display_post` (`id` INT, `titulo` INT, `descr_post` INT, `fecha_publ` INT, `status` INT);

-- -----------------------------------------------------
-- Placeholder table for view `eshaku`.`v_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eshaku`.`v_profile` (`nom_usuario` INT, `telefono` INT, `direccion` INT, `correo` INT);

-- -----------------------------------------------------
-- procedure sp_delete_post
-- -----------------------------------------------------

DELIMITER $$
USE `eshaku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_post`(id_post INT)
BEGIN  DELETE FROM post WHERE id = id_post; END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_register_user
-- -----------------------------------------------------

DELIMITER $$
USE `eshaku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_user`(user_name varchar(64), passwd varchar(64), address varchar(100), ph_number varchar(10), email varchar(100))
BEGIN  INSERT INTO usuario (nom_usuario, contrasena, direccion, telefono, correo) VALUES(user_name, sha(passwd), address, ph_number, email); END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_update_ph_number
-- -----------------------------------------------------

DELIMITER $$
USE `eshaku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_ph_number`(sp_id int, sp_ph_number varchar(10))
BEGIN UPDATE usuario SET telefono = sp_ph_number WHERE id = sp_id; END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure sp_user_login
-- -----------------------------------------------------

DELIMITER $$
USE `eshaku`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_user_login`(p_user_id VARCHAR(64), p_passwd VARCHAR(64))
BEGIN SELECT * FROM usuario WHERE p_user_id = usuario.id AND p_passwd = usuario.contrasena; END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `eshaku`.`donadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshaku`.`donadores`;
USE `eshaku`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eshaku`.`donadores` AS select `eshaku`.`usuario`.`id` AS `id`,`eshaku`.`usuario`.`nom_usuario` AS `nom_usuario`,`eshaku`.`usuario`.`contrasena` AS `contrasena`,`eshaku`.`usuario`.`telefono` AS `telefono`,`eshaku`.`usuario`.`direccion` AS `direccion`,`eshaku`.`usuario`.`correo` AS `correo`,`eshaku`.`usuario`.`donador` AS `donador`,`eshaku`.`usuario`.`solicitante` AS `solicitante` from `eshaku`.`usuario` where (`eshaku`.`usuario`.`donador` = true);

-- -----------------------------------------------------
-- View `eshaku`.`v_display_post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshaku`.`v_display_post`;
USE `eshaku`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eshaku`.`v_display_post` AS select `eshaku`.`post`.`id` AS `id`,`eshaku`.`post`.`titulo` AS `titulo`,`eshaku`.`post`.`descr_post` AS `descr_post`,`eshaku`.`post`.`fecha_publ` AS `fecha_publ`,`eshaku`.`post`.`status` AS `status` from `eshaku`.`post`;

-- -----------------------------------------------------
-- View `eshaku`.`v_profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `eshaku`.`v_profile`;
USE `eshaku`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `eshaku`.`v_profile` AS select `eshaku`.`usuario`.`nom_usuario` AS `nom_usuario`,`eshaku`.`usuario`.`telefono` AS `telefono`,`eshaku`.`usuario`.`direccion` AS `direccion`,`eshaku`.`usuario`.`correo` AS `correo` from `eshaku`.`usuario`;
USE `eshaku`;

DELIMITER $$
USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_insert_on_usuario`
AFTER INSERT ON `eshaku`.`usuario`
FOR EACH ROW
BEGIN INSERT INTO usuario_log VALUES(user(), "INSERTED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_updt_on_usuario`
AFTER UPDATE ON `eshaku`.`usuario`
FOR EACH ROW
BEGIN INSERT INTO usuario_log VALUES(user(), "UPDATED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_delete_on_usuario`
AFTER DELETE ON `eshaku`.`usuario`
FOR EACH ROW
BEGIN INSERT INTO usuario_log VALUES(user(), "DELETED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_insert_on_mensaje`
AFTER INSERT ON `eshaku`.`mensaje`
FOR EACH ROW
BEGIN INSERT INTO mensaje_log VALUES(user(), "INSERTED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_updt_on_mensaje`
AFTER UPDATE ON `eshaku`.`mensaje`
FOR EACH ROW
BEGIN INSERT INTO mensaje_log VALUES(user(), "UPDATED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_delete_on_mensaje`
AFTER DELETE ON `eshaku`.`mensaje`
FOR EACH ROW
BEGIN INSERT INTO mensaje_log VALUES(user(), "DELETED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_insert_on_post`
AFTER INSERT ON `eshaku`.`post`
FOR EACH ROW
BEGIN INSERT INTO post_log VALUES(user(), "INSERTED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`tgr_delete_complete`
AFTER UPDATE ON `eshaku`.`post`
FOR EACH ROW
BEGIN IF NEW.status = 2 THEN  DELETE FROM post; END IF; END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_updt_on_post`
AFTER UPDATE ON `eshaku`.`post`
FOR EACH ROW
BEGIN INSERT INTO post_log VALUES(user(), "UPDATED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_delete_on_post`
AFTER DELETE ON `eshaku`.`post`
FOR EACH ROW
BEGIN INSERT INTO post_log VALUES(user(), "DELETED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_insert_on_prenda`
AFTER INSERT ON `eshaku`.`prenda`
FOR EACH ROW
BEGIN INSERT INTO prenda_log VALUES(user(), "INSERTED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_updt_on_prenda`
AFTER UPDATE ON `eshaku`.`prenda`
FOR EACH ROW
BEGIN INSERT INTO prenda_log VALUES(user(), "UPDATED ENTRY"); END$$

USE `eshaku`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `eshaku`.`trgr_delete_on_prenda`
AFTER DELETE ON `eshaku`.`prenda`
FOR EACH ROW
BEGIN INSERT INTO prenda_log VALUES(user(), "DELETED ENTRY"); END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;