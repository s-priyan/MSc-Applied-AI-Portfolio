-- Use the created database
USE science_archives;

-- Create the Item_subject_focus table with appropriate columns, types, and constraints
CREATE TABLE Item_subject_focus (
    item_id INT,
    subject_area_id INT,
    PRIMARY KEY (item_id, subject_area_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_area_id) REFERENCES Subject_area(subject_area_id) ON DELETE CASCADE
);

-- Insert records into Item_subject_focus table
INSERT INTO Item_subject_focus (item_id, subject_area_id)
VALUES
(101, 1), -- "AI in Healthcare" focuses on Artificial Intelligence
(102, 3), -- "Deep Learning Advances" focuses on Data Science
(103, 2), -- "Quantum Computing Overview" focuses on Quantum Computing
(104, 3), -- "Data Science for Beginners" focuses on Data Science
(105, 5); -- "Ethical AI Considerations" focuses on Biomedical Engineering

-- Example queries which violate the constraints

-- 1. Trying to insert a record with an item_id or subject_area_id that does not exist
INSERT INTO Item_subject_focus (item_id, subject_area_id) 
VALUES (999, 1000);  

-- 2. Trying to insert duplicate (item_id, subject_area_id) pairs:
INSERT INTO Item_subject_focus (item_id, subject_area_id) 
VALUES (101, 1);  -- Same (item_id, subject_area_id) already exists


