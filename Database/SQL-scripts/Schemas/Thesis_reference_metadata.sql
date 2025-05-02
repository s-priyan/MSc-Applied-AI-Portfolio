-- Use the created database
USE science_archives;

-- Create the Thesis_reference_metadata table with appropriate columns, types, and constraints
CREATE TABLE Thesis_reference_metadata (
    reference_id INT PRIMARY KEY,
    type_of_thesis VARCHAR(100) NOT NULL,
    academic_institution VARCHAR(255) NOT NULL,
    year_of_publication YEAR NOT NULL,
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE
);

-- Insert records into Thesis_reference_metadata table
INSERT INTO Thesis_reference_metadata (reference_id, type_of_thesis, academic_institution, year_of_publication)
VALUES 
(5004, 'PhD Thesis', 'University of Oxford', 2022),
(5005, 'Master\'s Thesis', 'Massachusetts Institute of Technology', 2023);

-- Example queries which violate the constraints

-- 1. Trying to insert a reference_id that does not exist in Item
INSERT INTO Thesis_reference_metadata (reference_id, type_of_thesis, academic_institution, year_of_publication) 
VALUES (999, 'PhD Thesis', 'Harvard University', 2024); -- Assuming reference_id=999 does not exist in Item

-- 2. Trying to insert a duplicate reference_id
INSERT INTO Thesis_reference_metadata (reference_id, type_of_thesis, academic_institution, year_of_publication) 
VALUES (5004, 'Master Thesis', 'Oxford University', 2022);

-- 3. Trying to insert an entry with missing mandatory fields
INSERT INTO Thesis_reference_metadata (reference_id, type_of_thesis, academic_institution, year_of_publication) 
VALUES (2, NULL, 'MIT', 2023); -- type_of_thesis is NULL, which is not allowed

