-- Create the database
create database science_archives;

-- Use the created database
USE science_archives;

-- Create the User_detail table with appropriate columns, types, and constraints
CREATE TABLE User_detail (
    user_id INT PRIMARY KEY ,
    username VARCHAR(100) NOT NULL UNIQUE,
    pwd VARCHAR(255) NOT NULL,
    email TEXT,
    phone_number TEXT,
    contact_preference ENUM('Email', 'Phone', 'Both') NOT NULL,
    capacity ENUM('Reader', 'Author', 'Both') NOT NULL
);

-- Insert records into the User_detail table
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(1, 'john_doe', 'password123', 'john.doe@example.com', '1234567890', 'Email', 'Reader'),
(2, 'jane_smith', 'securepass456', 'jane.smith@example.com', '0987654321', 'Phone', 'Author'),
(3, 'alex_jones', 'mypassword789', 'alex.jones@example.com', '9876543210', 'Both', 'Both'),
(4, 'mary_johnson', 'marypass321', 'mary.johnson@example.com', '1122334455', 'Phone', 'Reader'),
(5, 'sam_wilson', 'sampassword987', 'sam.wilson@example.com', '5566778899', 'Email', 'Author');

-- Example queries which violate the constraints

-- 1. Insert with a duplicate username
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(6, 'john_doe', 'newpassword123', 'john.new@example.com', '3334445555', 'Email', 'Reader');

-- 2. Insert without specifying contact_preference (NULL value)
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(7, 'emily_davis', 'emilypass123', 'emily.davis@example.com', '4445556666', NULL, 'Author');

-- 3. Insert with an invalid value for contact_preference
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(8, 'george_williams', 'georgepass456', 'george.williams@example.com', '7778889999', 'Fax', 'Reader');

-- 4. Insert with an invalid value for capacity
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(9, 'lisa_miller', 'lisapass789', 'lisa.miller@example.com', '1112223333', 'Email', 'Admin');

-- 5. Insert with a duplicate user_id
INSERT INTO User_detail (user_id, username, pwd, email, phone_number, contact_preference, capacity)
VALUES
(1, 'jack_smith', 'jackpassword987', 'jack.smith@example.com', '1233211233', 'Phone', 'Both');



