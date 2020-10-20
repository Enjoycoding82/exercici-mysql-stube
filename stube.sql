-- MySQL Workbench Synchronization
-- Generated: 2020-10-20 21:33
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Mariajo

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `stube` DEFAULT CHARACTER SET utf8mb4 ;

CREATE TABLE IF NOT EXISTS `stube`.`usuaris` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL COMMENT 'email de l\'usuari',
  `contrasenya` VARCHAR(255) NOT NULL COMMENT 'contrasenya de l\'usuari',
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE IF NOT EXISTS `stube`.`videos` (
  `id` INT(10) UNSIGNED NOT NULL COMMENT 'id del vídeo, no és AI, però sí UQ',
  `url` VARCHAR(255) NOT NULL COMMENT 'url del vídeo',
  `titol` VARCHAR(100) NOT NULL COMMENT 'títol del vídeo',
  `descripcio` VARCHAR(500) NULL DEFAULT NULL COMMENT 'descripció del vídeo',
  `usuaris_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `usuaris_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_videos_usuaris_idx` (`usuaris_id` ASC) VISIBLE,
  CONSTRAINT `fk_videos_usuaris`
    FOREIGN KEY (`usuaris_id`)
    REFERENCES `stube`.`usuaris` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
