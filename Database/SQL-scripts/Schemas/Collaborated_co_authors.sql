-- Use the created database
USE science_archives;

-- Create the Collaborated_co_authors table with appropriate columns, types, and constraints
CREATE TABLE Collaborated_co_authors (
    user_id INT,
    co_author_id INT CHECK (user_id != co_author_id) ,
    PRIMARY KEY (user_id, co_author_id),
    FOREIGN KEY (user_id) REFERENCES User_detail(user_id) ON DELETE CASCADE,
    FOREIGN KEY (co_author_id) REFERENCES User_detail(user_id) ON DELETE CASCADE
);

-- Insert records into Collaborated_co_authors table
INSERT INTO Collaborated_co_authors (user_id, co_author_id)
VALUES
(1, 2), -- John Doe collaborated with Jane Smith
(1, 3), -- John Doe collaborated with Alex Jones
(2, 4), -- Jane Smith collaborated with Mary Johnson
(3, 5), -- Alex Jones collaborated with Sam Wilson
(4, 5); -- Mary Johnson collaborated with Sam Wilson

-- Example queries which violate the constraints


-- 1. Trying to insert a record where user_id or co_author_id does not exist in User_detail
INSERT INTO Collaborated_co_authors (user_id, co_author_id) 
VALUES (999, 1000);  -- 999 and 1000 do not exist in User_detail

-- 2. Inserting the same (user_id, co_author_id) combination twice
INSERT INTO Collaborated_co_authors (user_id, co_author_id) 
VALUES (1, 2);  -- This will violate the primary key constraint

-- 3. A user cannot collaborate with themselves:
INSERT INTO Collaborated_co_authors (user_id, co_author_id) 
VALUES (3, 3);  -- Fails due to CHECK (user_id != co_author_id)



