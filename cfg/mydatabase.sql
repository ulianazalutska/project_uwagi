CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

CREATE TABLE persons (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    last_entry TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE remarks (
    remark_id INT AUTO_INCREMENT PRIMARY KEY,
    offender_id INT,
    description TEXT,
    points INT CHECK (points BETWEEN -100 AND 100),
    remark_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (offender_id) REFERENCES persons(person_id) ON DELETE CASCADE
);
