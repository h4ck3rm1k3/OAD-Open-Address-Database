-- 
-- Created by SQL::Translator::Producer::MySQL
-- Created on Mon Feb  8 10:58:34 2010
-- 
SET foreign_key_checks=0;

DROP TABLE IF EXISTS `addresses`;

--
-- Table: `addresses`
--
CREATE TABLE `addresses` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(255) NOT NULL,
  `suburb` VARCHAR(255) NOT NULL,
  `state` VARCHAR(255) NOT NULL,
  `country` VARCHAR(255) NOT NULL,
  `lat` integer(11) NOT NULL,
  `lon` integer(11) NOT NULL,
  `addedby` BIGINT(20) NOT NULL,
  `locatedby` BIGINT(20) NOT NULL,
  INDEX addresses_idx_addedby (`addedby`),
  INDEX addresses_idx_locatedby (`locatedby`),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--  CONSTRAINT `addresses_fk_addedby` FOREIGN KEY (`addedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
--  CONSTRAINT `addresses_fk_locatedby` FOREIGN KEY (`locatedby`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE

DROP TABLE IF EXISTS `users`;

--
-- Table: `users`
--
CREATE TABLE `users` (
  `id` BIGINT(20) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

SET foreign_key_checks=1;

