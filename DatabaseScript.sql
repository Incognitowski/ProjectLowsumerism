-- MySQL Workbench Synchronization
-- Generated: 2018-09-30 22:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Junior

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `projectlow` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `projectlow`.`users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(250) NOT NULL,
  `user_fullname` VARCHAR(300) NOT NULL,
  `user_description` TEXT NOT NULL,
  `user_password` VARCHAR(500) NOT NULL,
  `user_type` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  `softdelete` TINYINT(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  INDEX `fk_users_user_types_idx` (`user_type` ASC) VISIBLE,
  CONSTRAINT `fk_users_user_types`
    FOREIGN KEY (`user_type`)
    REFERENCES `projectlow`.`user_types` (`utype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`user_types` (
  `utype_id` INT(11) NOT NULL AUTO_INCREMENT,
  `utype_name` VARCHAR(250) NOT NULL,
  `user_typescol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`utype_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`password_recovery` (
  `passrec_id` INT(11) NOT NULL AUTO_INCREMENT,
  `passrec_token` VARCHAR(250) NOT NULL,
  `passres_user` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`passrec_id`),
  INDEX `fk_password_recovery_users1_idx` (`passres_user` ASC) VISIBLE,
  CONSTRAINT `fk_password_recovery_users1`
    FOREIGN KEY (`passres_user`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`categories` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `category_type` INT(11) NOT NULL,
  `category_name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_categories_types1_idx` (`category_type` ASC) VISIBLE,
  CONSTRAINT `fk_categories_types1`
    FOREIGN KEY (`category_type`)
    REFERENCES `projectlow`.`types` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`types` (
  `type_id` INT(11) NOT NULL AUTO_INCREMENT,
  `type_name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`offers` (
  `offer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `offer_title` VARCHAR(300) NOT NULL,
  `offer_description` TEXT NOT NULL,
  `offer_category` INT(11) NOT NULL,
  `offer_publication` DATETIME NOT NULL,
  `offer_status` INT(11) NOT NULL,
  `offer_price` INT(11) NOT NULL,
  `offer_persist` TINYINT(4) NOT NULL DEFAULT 0,
  `offer_user` INT(11) NOT NULL,
  PRIMARY KEY (`offer_id`),
  INDEX `fk_offers_offer_status1_idx` (`offer_status` ASC) VISIBLE,
  INDEX `fk_offers_categories1_idx` (`offer_category` ASC) VISIBLE,
  INDEX `fk_offers_users1_idx` (`offer_user` ASC) VISIBLE,
  CONSTRAINT `fk_offers_offer_status1`
    FOREIGN KEY (`offer_status`)
    REFERENCES `projectlow`.`offer_status` (`offsta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offers_categories1`
    FOREIGN KEY (`offer_category`)
    REFERENCES `projectlow`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offers_users1`
    FOREIGN KEY (`offer_user`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`offer_status` (
  `offsta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `offsta_name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`offsta_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`messages` (
  `message_id` INT(11) NOT NULL AUTO_INCREMENT,
  `message_sender` INT(11) NOT NULL,
  `message_reciever` INT(11) NOT NULL,
  `message_content` TEXT NOT NULL,
  PRIMARY KEY (`message_id`),
  INDEX `fk_messages_users1_idx` (`message_sender` ASC) VISIBLE,
  INDEX `fk_messages_users2_idx` (`message_reciever` ASC) VISIBLE,
  CONSTRAINT `fk_messages_users1`
    FOREIGN KEY (`message_sender`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_messages_users2`
    FOREIGN KEY (`message_reciever`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`trades` (
  `trade_id` INT(11) NOT NULL AUTO_INCREMENT,
  `trade_final_update` DATETIME NOT NULL,
  `trade_status` INT(11) NOT NULL,
  `trade_user` INT(11) NOT NULL,
  `trade_offer` INT(11) NOT NULL,
  `trade_price` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`trade_id`),
  INDEX `fk_trades_offers1_idx` (`trade_offer` ASC) VISIBLE,
  INDEX `fk_trades_users1_idx` (`trade_user` ASC) VISIBLE,
  INDEX `fk_trades_trade_status1_idx` (`trade_status` ASC) VISIBLE,
  CONSTRAINT `fk_trades_offers1`
    FOREIGN KEY (`trade_offer`)
    REFERENCES `projectlow`.`offers` (`offer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trades_users1`
    FOREIGN KEY (`trade_user`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_trades_trade_status1`
    FOREIGN KEY (`trade_status`)
    REFERENCES `projectlow`.`trade_status` (`trasta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`trade_status` (
  `trasta_id` INT(11) NOT NULL AUTO_INCREMENT,
  `trasta_name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`trasta_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`rating` (
  `rating_id` INT(11) NOT NULL AUTO_INCREMENT,
  `rating_trade` INT(11) NOT NULL,
  `rating_score` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`rating_id`),
  INDEX `fk_rating_trades1_idx` (`rating_trade` ASC) VISIBLE,
  CONSTRAINT `fk_rating_trades1`
    FOREIGN KEY (`rating_trade`)
    REFERENCES `projectlow`.`trades` (`trade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`transactions` (
  `transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `transaction_user` INT(11) NOT NULL,
  `transaction_type` INT(11) NOT NULL,
  `transaction_value` INT(11) NOT NULL,
  `transaction_trade` INT(11) NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transactions_trades1_idx` (`transaction_trade` ASC) VISIBLE,
  INDEX `fk_transactions_users1_idx` (`transaction_user` ASC) VISIBLE,
  INDEX `fk_transactions_transaction_types1_idx` (`transaction_type` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_trades1`
    FOREIGN KEY (`transaction_trade`)
    REFERENCES `projectlow`.`trades` (`trade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_users1`
    FOREIGN KEY (`transaction_user`)
    REFERENCES `projectlow`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_transaction_types1`
    FOREIGN KEY (`transaction_type`)
    REFERENCES `projectlow`.`transaction_types` (`tratype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `projectlow`.`transaction_types` (
  `tratype_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tratype_name` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`tratype_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
