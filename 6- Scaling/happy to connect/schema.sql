CREATE TABLE `Users`(
    `first_name` VARCHAR(32) ,
    `last_name` VARCHAR(32) ,
    `username` VARCHAR(32),
    `password` VARCHAR(32) ,
    PRIMARY KEY (`username`)
);

CREATE TABLE `Schools`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    `year` YEAR NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `Companies`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `User_Connections`(
    `A`  VARCHAR(32),
    `B`  VARCHAR(32),
    FOREIGN KEY (`A`) REFERENCES `Users`(`username`),
    FOREIGN KEY (`B`) REFERENCES `Users`(`username`)
);

CREATE TABLE `School_Connections`(
    `end_date` DATE,
    `start_date` DATE NOT NULL,
    `school_id` INT UNSIGNED,
    `user_name` VARCHAR(32) ,
    `degree` ENUM ('BA', 'MA', 'PhD') NOT NULL,
    FOREIGN KEY (`school_id`) REFERENCES `Schools`(`id`),
    FOREIGN KEY (`user_name`) REFERENCES `Users`(`username`)
);

CREATE TABLE `Companies_Connections`(
    `end_date` DATE,
    `start_date` DATE NOT NULL,
    `company_id` INT UNSIGNED,
    `user_name` VARCHAR(32) ,
    `title` VARCHAR(32) NOT NULL,
    FOREIGN KEY (`company_id`) REFERENCES `Companies`(`id`),
    FOREIGN KEY (`user_name`) REFERENCES `Users`(`username`)
);
