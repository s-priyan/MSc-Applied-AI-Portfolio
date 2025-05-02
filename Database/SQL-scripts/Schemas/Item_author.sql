-- Use the created database
USE science_archives;

-- Create the Item_author table with appropriate columns, types, and constraints
CREATE TABLE Item_author (
    reference_id INT,
    author_id INT,
    PRIMARY KEY (reference_id, author_id),
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES User_detail(user_id) ON DELETE CASCADE
);

-- Insert records into Item_author table
INSERT INTO Item_author (reference_id, author_id)
VALUES
(5001, 2), -- jane_smith wrote the item with reference_id 5001
(5002, 3), -- alex_jones wrote the item with reference_id 5002
(5003, 4), -- mary_johnson wrote the item with reference_id 5003
(5004, 5), -- sam_wilson wrote the item with reference_id 5004
(5005, 2); -- jane_smith also contributed to the item with reference_id 5005

-- Example queries which violate the constraints

-- 1. Trying to insert an author_id or reference_id that does not exist
INSERT INTO Item_author (reference_id, author_id) 
VALUES (999, 1000);  

-- 2. Trying to insert a duplicate (reference_id, author_id) pair
INSERT INTO Item_author (reference_id, author_id) 
VALUES (5001, 5);  -- Duplicate (reference_id, author_id) already exists



