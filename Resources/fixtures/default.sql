SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE TABLE IF NOT EXISTS `settings`
(
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `is_hidden` TINYINT(1) DEFAULT 0 NOT NULL,
    `property` VARCHAR(100) NOT NULL,
    `value` VARCHAR(255),
    `type` VARCHAR(100) NOT NULL,
    `validation` VARCHAR(255),
    `units` VARCHAR(20),
    `description` TEXT,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `unique_property` (`property`)
) ENGINE=InnoDB;

INSERT INTO `settings` (`id`, `is_hidden`, `property`, `value`, `type`, `validation`, `units`, `description`) VALUES
(1, 0,  'Backend - Titulek',    'Fontai backend',   'string',   NULL,   NULL,   'Titulek v prohlížeči popisující backend'),
(3, 1,  'Texty - výchozí jazyk',    'cs',   'string',   NULL,   NULL,   NULL),
(4, 1,  'E-mail - Jméno odesílatele',   'Fontai backend',   'string',   NULL,   NULL,   NULL),
(5, 1,  'E-mail - BCC', 'system@fontai.com',    'string',   NULL,   NULL,   NULL),
(6, 1,  'E-mail - Returnpath',  'automat@fontai.com',   'string',   NULL,   NULL,   NULL),
(7, 1,  'E-mail - Odesílatel',  'automat@fontai.com',   'string',   NULL,   NULL,   NULL),
(8, 1,  'SMTP - Host',  '', 'string',   NULL,   NULL,   NULL),
(9, 1,  'SMTP - Port',  '25',   'integer',  NULL,   NULL,   NULL),
(10,    1,  'SMTP - Username',  '', 'string',   NULL,   NULL,   NULL),
(11,    1,  'SMTP - Heslo', '', 'string',   NULL,   NULL,   NULL),
(12,    1,  'Testovací prostředí',  '1',    'boolean',  NULL,   NULL,   NULL),
(13,    1,  'FCC url',  'control.fontai.com',   'string',   NULL,   NULL,   NULL),
(14,    1,  'Htaccess - Login', 'localhost',    'string',   NULL,   NULL,   NULL),
(15,    1,  'Htaccess - Heslo', 'h3slo',    'string',   NULL,   NULL,   NULL),
(16,    0,  'Maximální počet pokusů o přihlášení',  '10',   'integer',  NULL,   NULL,   NULL)
ON DUPLICATE KEY UPDATE id = id;