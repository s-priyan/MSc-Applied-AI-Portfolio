-- Use the created database
USE science_archives;

-- Create the User_subject_interest table with appropriate columns, types, and constraints
CREATE TABLE User_subject_interest (
    user_id INT,
    subject_area_id INT,
    PRIMARY KEY (user_id, subject_area_id),
    FOREIGN KEY (user_id) REFERENCES User_detail(user_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_area_id) REFERENCES Subject_area(subject_area_id) ON DELETE CASCADE
);

-- Insert records into User_subject_interest table
INSERT INTO User_subject_interest (user_id, subject_area_id)
VALUES
(1, 1), -- John Doe is interested in Artificial Intelligence
(1, 3), -- John Doe is also interested in Data Science
(2, 2), -- Jane Smith is interested in Quantum Computing
(3, 4), -- Alex Jones is interested in Cybersecurity
(4, 5); -- Mary Johnson is interested in Biomedical Engineering

-- Example queries which violate the constraints

-- 1. Trying to insert a record with a user_id or subject_area_id that does not exist
INSERT INTO User_subject_interest (user_id, subject_area_id) 
VALUES (999, 1000);  

-- 2. Trying to insert duplicate (user_id, subject_area_id) pairs
INSERT INTO User_subject_interest (user_id, subject_area_id) 
VALUES (1, 1);

