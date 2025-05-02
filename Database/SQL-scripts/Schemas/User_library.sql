-- Use the created database
USE science_archives;

-- Create the User_library table with appropriate columns, types, and constraints
CREATE TABLE User_library (
    user_id INT,
    item_id INT,
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY (user_id) REFERENCES User_detail(user_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Item(item_id) ON DELETE CASCADE
);

-- Insert records into User_library table
INSERT INTO User_library (user_id, item_id)
VALUES
(1, 101),
(1, 103),
(2, 102),
(3, 104),
(4, 105);

-- Example queries which violate the constraints

-- 1. Trying to insert a record with non-existent user_id or item_id
INSERT INTO User_library (user_id, item_id) 
VALUES (999, 1000);  

-- 2. Inserting duplicate (user_id, item_id) pairs:
INSERT INTO User_library (user_id, item_id) 
VALUES (1, 101);
