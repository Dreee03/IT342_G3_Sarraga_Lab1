-- Init script for local XAMPP (MariaDB / MySQL)
-- Run this in phpMyAdmin > SQL or via mysql CLI

-- Create database
CREATE DATABASE IF NOT EXISTS `it342_Sarraga` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Optionally create a dedicated user (recommended)
-- Replace 'secure_password' with a strong password, or omit user creation to use root
CREATE USER IF NOT EXISTS 'auth_user'@'localhost' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON `it342_Sarraga`.* TO 'auth_user'@'localhost';
FLUSH PRIVILEGES;

-- Example: create a table (optional)
-- USE `auth_db`;
-- CREATE TABLE IF NOT EXISTS users (
--   id BIGINT AUTO_INCREMENT PRIMARY KEY,
--   username VARCHAR(100) NOT NULL UNIQUE,
--   password VARCHAR(255) NOT NULL,
--   email VARCHAR(255)
-- );
-- Create tables commonly used by an authentication system
USE `it342_Sarraga`;

CREATE TABLE IF NOT EXISTS `roles` (
	`id` BIGINT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL UNIQUE,
	`description` VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `users` (
	`id` BIGINT AUTO_INCREMENT PRIMARY KEY,
	`username` VARCHAR(100) NOT NULL UNIQUE,
	`password` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255),
	`enabled` TINYINT(1) NOT NULL DEFAULT 1,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `user_roles` (
	`user_id` BIGINT NOT NULL,
	`role_id` BIGINT NOT NULL,
	PRIMARY KEY (`user_id`,`role_id`),
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`role_id`) REFERENCES `roles`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Optional table for storing refresh tokens
CREATE TABLE IF NOT EXISTS `refresh_tokens` (
	`id` BIGINT AUTO_INCREMENT PRIMARY KEY,
	`user_id` BIGINT NOT NULL,
	`token` VARCHAR(512) NOT NULL,
	`expiry_date` DATETIME NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed a basic role and admin user (password should be hashed by app in production)
INSERT IGNORE INTO `roles` (`name`,`description`) VALUES ('ROLE_USER','Default user role'),('ROLE_ADMIN','Administrator');

-- Example admin user (replace password with bcrypt hash produced by your app)
-- INSERT IGNORE INTO `users` (`username`,`password`,`email`) VALUES ('admin','$2y$10$EXAMPLEHASHEDPASSWORD', 'admin@example.com');
-- INSERT IGNORE INTO `user_roles` (`user_id`,`role_id`) VALUES (1,2);
