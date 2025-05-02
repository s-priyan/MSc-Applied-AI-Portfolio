-- Use the created database
USE science_archives;

-- Create the Item table with appropriate columns, types, and constraints
CREATE TABLE Item (
    item_id INT PRIMARY KEY,
	reference_id INT NOT NULL UNIQUE,
    url VARCHAR(255) NOT NULL UNIQUE,
    publication_type ENUM('Journal', 'Conference', 'Book', 'Thesis') NOT NULL,
    abstract_text TEXT CHECK (CHAR_LENGTH(abstract_text) <= 700)
);

-- Insert sample records into the Item table
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text)
VALUES
(101, 5001, 'https://library.example.com/ai-in-healthcare', 'Book', 'A book exploring AI applications in healthcare.'),
(102, 5002, 'https://library.example.com/deep-learning-advances', 'Journal', 'Latest research on deep learning breakthroughs.'),
(103, 5003, 'https://library.example.com/quantum-computing-overview', 'Conference', 'A conference paper discussing quantum computing fundamentals.'),
(104, 5004, 'https://library.example.com/data-science-for-beginners', 'Book', 'An introduction to data science principles and techniques.'),
(105, 5005, 'https://library.example.com/ethical-ai-considerations', 'Thesis', 'A thesis on ethical considerations in AI development.');

-- Example queries which violate the constraints

-- 1. Trying to insert duplicate item_id values
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text)
VALUES
(101, 5001, 'https://library.example.com/ai-in-healthcare', 'Book', 'A book exploring AI applications in healthcare.');

-- 2. Trying to insert duplicate reference_id or url
-- Duplicate reference_id
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (106, 5004, 'https://example.com/article4', 'Thesis', 'Different abstract.');  

-- Duplicate url
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (106, 5006, 'https://library.example.com/ethical-ai-considerations', 'Journal', 'Another abstract.');  

-- 3. Trying to insert a NULL reference_id or url or publication_type
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (5, NULL, 'https://library.example.com/ethical-ai-considerations', 'Journal', 'Valid abstract.');  -- reference_id cannot be NULL

INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (5, 105, NULL, 'Journal', 'Valid abstract.');  -- url cannot be NULL

INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (6, 106, 'https://example.com/article6', NULL, 'Valid abstract.');  -- publication_type cannot be NULL

-- 4. Trying to insert an invalid publication_type
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (7, 107, 'https://example.com/article7', 'Magazine', 'Abstract.');  -- 'Magazine' is not in ENUM ('Journal', 'Conference', 'Book', 'Thesis')

-- 5. Trying to insert an abstract_text longer than 700 characters
INSERT INTO Item (item_id, reference_id, url, publication_type, abstract_text) 
VALUES (8, 108, 'https://example.com/article8', 'Journal', REPEAT('A', 701));  -- Abstract exceeds 700 characters


