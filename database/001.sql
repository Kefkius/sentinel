
/*
  DROP TABLES to facilitate development and testing
  TODO: Determine if this should be removed for production
*/
DROP TABLE IF EXISTS `governance_object`;
DROP TABLE IF EXISTS `proposal`;
DROP TABLE IF EXISTS `superblock`;
DROP TABLE IF EXISTS `event`;
DROP TABLE IF EXISTS `action`;
DROP TABLE IF EXISTS `setting`;

/*
  DATABASE TABLES

*/


CREATE TABLE `governance_object` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `object_creation_time` int(11) NOT NULL DEFAULT '0',
  `object_hash` varchar(255) NOT NULL DEFAULT '',
  `object_parent_hash` varchar(255) NOT NULL DEFAULT '',
  `object_name` varchar(64) NOT NULL DEFAULT '',
  `object_type` int(20) NOT NULL DEFAULT '0',
  `object_revision` int(20) NOT NULL DEFAULT '0',
  `object_data` text NOT NULL,
  `object_fee_tx` varchar(255) NOT NULL DEFAULT '',
  `object_status` varchar(255) NOT NULL DEFAULT '',
  `object_origin` varchar(255) NOT NULL DEFAULT '',
  `is_valid` tinyint(1) DEFAULT NULL,
  `absolute_yes_count` int(11) NOT NULL DEFAULT 0,
  `yes_count` int(11) NOT NULL DEFAULT 0,
  `no_count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `proposal` (  
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `governance_object_id` int(11) DEFAULT NULL,
  `proposal_name` varchar(255) DEFAULT NULL,
  `start_epoch` int(11) DEFAULT NULL,
  `end_epoch` int(11) DEFAULT NULL,
  `payment_address` varchar(255) DEFAULT NULL,
  `payment_amount` decimal(16,8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`governance_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE superblock (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `governance_object_id` int(11) DEFAULT NULL,
  `superblock_name` varchar(255) DEFAULT NULL,
  `event_block_height` int(11) DEFAULT NULL,
  `payment_addresses` text,
  `payment_amounts` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index2` (`governance_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `event` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `governance_object_id` int(11) DEFAULT NULL,
  `start_time` int(11) NOT NULL DEFAULT '0',
  `prepare_time` int(11) NOT NULL DEFAULT '0',
  `submit_time` int(11) NOT NULL DEFAULT '0',
  `error_time` int(11) NOT NULL DEFAULT '0',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `governance_object_id` (`governance_object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

CREATE TABLE `action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `governance_object_id` int(11) DEFAULT NULL,
  `absolute_yes_count` int DEFAULT NULL,
  `yes_count` int DEFAULT NULL,
  `no_count` int DEFAULT NULL,
  `abstain_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime` int(11) DEFAULT '0',
  `setting` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
