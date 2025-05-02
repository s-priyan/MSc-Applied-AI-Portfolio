-- Use the created database
USE science_archives;

-- Create the Book_reference_metadata table with appropriate columns, types, and constraints
CREATE TABLE Book_reference_metadata (
    reference_id INT PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    series_title VARCHAR(255),
    series_number INT CHECK (series_number > 0),
    edition VARCHAR(50),
    place_of_publication VARCHAR(255) NOT NULL,
    publisher VARCHAR(255) NOT NULL,
    year_of_publication YEAR NOT NULL,
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE
);

-- Insert a record into Book_reference_metadata table
INSERT INTO Book_reference_metadata (reference_id, book_title, series_title, series_number, edition, place_of_publication, publisher, year_of_publication)
VALUES 
(5003, 'Artificial Intelligence: A Modern Approach', 'AI Series', 3, '4th', 'New York, USA', 'Pearson', 2021);

-- Example queries which violate the constraints

-- 1. Trying to insert a reference_id that does not exist in Item
INSERT INTO Book_reference_metadata (reference_id, book_title, series_title, series_number, edition, place_of_publication, publisher, year_of_publication) 
VALUES (999, 'Advanced AI Techniques', 'AI Research Series', 1, '2nd', 'London', 'Springer', 2024);

-- 2. Trying to insert a duplicate reference_id
INSERT INTO Book_reference_metadata (reference_id, book_title, place_of_publication, publisher, year_of_publication) 
VALUES (5003, 'Data Science Handbook', 'New York', 'O’Reilly', 2023);

-- 3. Trying to insert an entry with missing mandatory fields
INSERT INTO Book_reference_metadata (reference_id, book_title, place_of_publication, publisher, year_of_publication) 
VALUES (2, NULL, 'Berlin', 'Springer', 2022); -- book_title is NULL, which is not allowed

-- 4. Trying to insert an invalid series_number
INSERT INTO Book_reference_metadata (reference_id, book_title, series_title, series_number, edition, place_of_publication, publisher, year_of_publication) 
VALUES (3, 'AI Ethics', 'Ethical AI Series', -1, '1st', 'Paris', 'Tech Press', 2023); -- series_number must be greater than 0




