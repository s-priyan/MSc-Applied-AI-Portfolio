-- Use the created database
USE science_archives;

-- Create the Conference_proceeding_paper table with appropriate columns, types, and constraints
CREATE TABLE Conference_proceeding_paper (
    reference_id INT PRIMARY KEY,
    title_of_paper VARCHAR(255) NOT NULL,
    title_of_conference VARCHAR(255) NOT NULL,
    place_of_publication VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    year_of_publication YEAR NOT NULL,
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE
);

-- Insert a record into Conference_proceeding_paper table
INSERT INTO Conference_proceeding_paper (reference_id, title_of_paper, title_of_conference, place_of_publication, publisher, year_of_publication)
VALUES 
(5002, 'Deep Learning for Autonomous Vehicles', 'International Conference on Machine Learning (ICML)', 'London, UK', 'Springer', 2024);

-- Example queries which violate the constraints

-- 1. Trying to insert a reference_id that does not exist in Item
INSERT INTO Conference_proceeding_paper (reference_id, title_of_paper, title_of_conference, place_of_publication, publisher, year_of_publication) 
VALUES (999, 'AI Ethics in Healthcare', 'International AI Conference', 'London', 'Tech Press', 2024);

-- 2. Trying to insert a duplicate reference_id
INSERT INTO Conference_proceeding_paper (reference_id, title_of_paper, title_of_conference, place_of_publication, publisher, year_of_publication) 
VALUES (5002, 'Deep Learning Innovations', 'Neural Networks Symposium', 'New York', 'Science Publishers', 2023);

-- 3. Trying to insert an entry with missing mandatory fields
INSERT INTO Conference_proceeding_paper (reference_id, title_of_paper, title_of_conference, place_of_publication, publisher, year_of_publication) 
VALUES (2, NULL, 'Computer Vision Conference', 'Berlin', 'Springer', 2022);-- title_of_paper is NULL, which is not allowed
