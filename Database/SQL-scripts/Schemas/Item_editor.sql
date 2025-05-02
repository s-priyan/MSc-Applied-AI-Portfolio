-- Use the created database
USE science_archives;

-- Create the Item_editor table with appropriate columns, types, and constraints
CREATE TABLE Item_editor (
    reference_id INT,
    editor_id INT,
    PRIMARY KEY (reference_id, editor_id),
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE,
    FOREIGN KEY (editor_id) REFERENCES User_detail(user_id) ON DELETE CASCADE
);


-- Insert a record into Item_editor table
INSERT INTO Item_editor (reference_id, editor_id)
VALUES 
(5002, 1); --  john_doe edited the item with reference_id 5002

-- Example queries which violate the constraints

-- 1. Trying to insert an editor_id or reference_id that does not exist
INSERT INTO Item_editor (reference_id, editor_id) 
VALUES (999, 1000); 

-- 2. Trying to insert a duplicate (reference_id, editor_id) pair
INSERT INTO Item_editor (reference_id, editor_id) 
VALUES (5002, 1);



