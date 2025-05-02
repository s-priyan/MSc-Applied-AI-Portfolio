-- Use the created database
USE science_archives;

-- Create the Item_review table with appropriate columns, types, and constraints
CREATE TABLE Item_review (
    user_id INT,
    item_id INT,
    review TEXT,
    review_score DECIMAL(3,2) NOT NULL,
    PRIMARY KEY (user_id, item_id),
    FOREIGN KEY (user_id) REFERENCES User_detail(user_id) ON DELETE CASCADE,
    FOREIGN KEY (item_id) REFERENCES Item(item_id) ON DELETE CASCADE
);

-- Insert records into Item_review table
INSERT INTO Item_review (user_id, item_id, review, review_score)
VALUES
(1, 101, 'An insightful book on AI applications in healthcare.', 4.75),
(2, 102, 'A detailed and well-structured journal on deep learning.', 4.50),
(3, 103, 'Great introduction to quantum computing concepts.', 4.20),
(4, 104, 'Good starting point for beginners in data science.', 4.00),
(5, 105, 'Ethical AI considerations well explained with examples.', 4.80);

-- Example queries which violate the constraints

-- 1. Trying to insert a review with a user_id or item_id that does not exist:
INSERT INTO Item_review (user_id, item_id, review, review_score) 
VALUES (999, 1000, 'Great article!', 4.50);  

-- 2. Trying to insert a duplicate (user_id, item_id) pair
INSERT INTO Item_review (user_id, item_id, review, review_score) 
VALUES (1, 101, 'Great!', 4.90);  -- Duplicate (user_id, item_id

-- 3. Trying to insert a NULL review_score
INSERT INTO Item_review (user_id, item_id, review, review_score) 
VALUES (1, 106, 'Interesting read.', NULL);  -- review_score cannot be NULL

-- 4. Decimal Constraint Violation
INSERT INTO Item_review (user_id, item_id, review, review_score) 
VALUES (3, 7, 'Excellent!', 10.00);  -- Exceeds max value of 9.99

