-- Use the created database
USE science_archives;

-- Create the Journal_reference_metadata table with appropriate columns, types, and constraints
CREATE TABLE Journal_reference_metadata (
    reference_id INT PRIMARY KEY,
    title_of_article VARCHAR(255) NOT NULL,
    title_of_journal VARCHAR(255) NOT NULL,
    year_of_publication YEAR NOT NULL,
    volume_number INT CHECK (volume_number > 0),
    issue_number INT,
    page_number VARCHAR(50),
    FOREIGN KEY (reference_id) REFERENCES Item(reference_id) ON DELETE CASCADE
);

-- Insert a record into Journal_reference_metadata table
INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number, issue_number, page_number)
VALUES 
(5001, 'Advancements in Quantum Machine Learning', 'International Journal of AI Research', 2023, 15, 3, '120-135');

-- Example queries which violate the constraints

-- 1. Trying to insert a reference_id that does not exist in Item
INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number) 
VALUES (999, 'AI in Healthcare', 'Journal of AI Research', 2024, 2);

-- 2. to insert a duplicate reference_id
INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number) 
VALUES (5001, 'Deep Learning Trends', 'AI Journal', 2023, 5);

-- 3. Trying to insert an entry with missing mandatory fields
INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number) 
VALUES (2, NULL, 'Science Journal', 2022, 3); -- title_of_article is NULL, which is not allowed

INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number) 
VALUES (2, 'Generative AI', NULL , 2022, 3); -- title_of_journal is NULL, which is not allowed

-- 4. Trying to insert a volume_number that is 0 or negative
INSERT INTO Journal_reference_metadata (reference_id, title_of_article, title_of_journal, year_of_publication, volume_number) 
VALUES (3, 'Quantum Computing', 'Physics Journal', 2025, 0);  -- Invalid volume_number



