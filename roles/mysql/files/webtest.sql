/*
Navicat MySQL Data Transfer

Source Server         : webtest1
Source Server Version : 50711
Source Host           : 192.168.1.5:3306
Source Database       : webtest

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-03-03 12:42:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `data` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_access
-- ----------------------------
DROP TABLE IF EXISTS `t_access`;
CREATE TABLE `t_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` int(11) NOT NULL,
  `domain_ip_type` tinyint(4) NOT NULL,
  `domain_ip_value` varchar(255) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_action
-- ----------------------------
DROP TABLE IF EXISTS `t_action`;
CREATE TABLE `t_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_type` tinyint(4) NOT NULL,
  `mail_id` int(11) DEFAULT NULL,
  `box_id` int(11) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `file_orig_name` varchar(255) DEFAULT NULL,
  `file_download_name` varchar(255) DEFAULT NULL,
  `action_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action_user` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_box
-- ----------------------------
DROP TABLE IF EXISTS `t_box`;
CREATE TABLE `t_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) NOT NULL,
  `period` int(11) NOT NULL,
  `limit` datetime NOT NULL,
  `box_storage_limit` datetime NOT NULL,
  `box_name` varchar(300) NOT NULL,
  `password_flg` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(255) DEFAULT NULL,
  `no_edit_flg` tinyint(4) NOT NULL DEFAULT '0',
  `no_download_flg` tinyint(4) NOT NULL DEFAULT '0',
  `box_url_key` varchar(36) NOT NULL,
  `admin_url_key` varchar(36) NOT NULL,
  `box_root_dir` varchar(255) NOT NULL,
  `insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` varchar(16) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `box_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_orig_name` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `virus_scan` tinyint(4) DEFAULT NULL,
  `upload_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upload_user` varchar(16) NOT NULL,
  `delete_time` datetime DEFAULT NULL,
  `delete_user` varchar(16) DEFAULT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_mail
-- ----------------------------
DROP TABLE IF EXISTS `t_mail`;
CREATE TABLE `t_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail` varchar(255) NOT NULL,
  `box_create_url_key` varchar(36) NOT NULL,
  `locale` varchar(2) NOT NULL DEFAULT 'ja',
  `insert_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `insert_user` varchar(16) NOT NULL,
  `delete_flg` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_domain_cache
-- ----------------------------
DROP TABLE IF EXISTS `t_domain_cache`;
CREATE TABLE `t_domain_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `insert_time` datetime NOT NULL,
  `insert_user` varchar(16) NOT NULL,
  `update_time` datetime NOT NULL,
  `update_user` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_domain_cache` (`ip_addr`,`domain`) USING BTREE,
  KEY `index_ip_addr` (`ip_addr`,`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
