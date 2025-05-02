-- Use the created database
USE science_archives;

-- Create the Subject_area table with appropriate columns, types, and constraints
CREATE TABLE Subject_area (
    subject_area_id INT PRIMARY KEY,
    subject_area VARCHAR(255) NOT NULL UNIQUE
);

-- Insert records into Subject_area table
INSERT INTO Subject_area (subject_area_id, subject_area)
VALUES
(1, 'Artificial Intelligence'),
(2, 'Quantum Computing'),
(3, 'Data Science'),
(4, 'Cybersecurity'),
(5, 'Biomedical Engineering');

-- Example queries which violate the constraints

-- 1. Trying to insert duplicate subject_area_id values:
INSERT INTO Subject_area (subject_area_id, subject_area) 
VALUES (1, 'Machine Learning');

-- 2. Trying to insert duplicate subject_area values:
INSERT INTO Subject_area (subject_area_id, subject_area) 
VALUES (6, 'Data science');

-- 3. Trying to insert a NULL value in subject_area:
INSERT INTO Subject_area (subject_area_id, subject_area) 
VALUES (4, NULL);  -- subject_area cannot be NULL
