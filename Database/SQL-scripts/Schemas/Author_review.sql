-- Use the created database
USE science_archives;

-- Create the Author_review table with appropriate columns, types, and constraints
CREATE TABLE Author_review (
    user_id INT,
    author_id INT CHECK (user_id != author_id),
    review TEXT,
    review_score DECIMAL(3,2),
    PRIMARY KEY (user_id, author_id),
    FOREIGN KEY (user_id) REFERENCES User_detail(user_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES User_detail(user_id) ON DELETE CASCADE
);

-- Insert records into Author_review table
INSERT INTO Author_review (user_id, author_id, review, review_score)
VALUES
(1, 2, 'Excellent author with in-depth knowledge of Quantum Computing.', 4.80),
(3, 2, 'Great insights and detailed explanations in publications.', 4.50),
(4, 5, 'The author presents ethical AI concepts in an engaging way.', 4.70),
(2, 3, 'Well-structured research articles with clear methodologies.', 4.60),
(5, 4, 'Good research contributions in the field of Biomedical Engineering.', 4.40);

-- Example queries which violate the constraints

-- 1. Trying to insert a review with a user_id or author_id that does not exist in User_detail
INSERT INTO Author_review (user_id, author_id, review, review_score) 
VALUES (999, 1000, 'Great researcher!', 4.80);  

-- 2. Trying to insert a duplicate (user_id, author_id) pair
INSERT INTO Author_review (user_id, author_id, review, review_score) 
VALUES (1, 2, 'Excellent work!', 4.90);

-- 3. Trying to insert a review_score greater than the allowed DECIMAL(3,2) max (9.99)
INSERT INTO Author_review (user_id, author_id, review, review_score) 
VALUES (3, 4, 'Outstanding contributions!', 10.00);  -- Exceeds max value of 9.99

-- 4. A user can not be able to review themselves (user_id = author_id)
INSERT INTO Author_review (user_id, author_id, review, review_score) 
VALUES (5, 5, 'I am amazing!', 5.00);  -- Logical issue, but allowed by the current schema






