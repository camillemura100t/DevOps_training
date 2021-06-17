CREATE DATABASE docker;

USE docker;

CREATE TABLE user (
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO user (id, name) VALUES
(1, 'Kevin'),
(2, 'Chris'),
(3, 'Camille'),
(4, 'Gérard');