-- Use the created database
USE science_archives;

-- Set the user ID once
SET @user_id = 2;  

-- Authors (Group2) match score calculation
SELECT 
    i.item_id,
    (
        -- Base score (w1=0.4)
        CASE 
            WHEN COALESCE(ir.avg_score, 0) > (SELECT AVG(review_score) FROM Item_review) 
                THEN COALESCE(ir.avg_score, 0) * 0.4 
            ELSE 0 
        END
        +
        -- Subject match (w2=0.3)
        (SELECT COALESCE(COUNT(*), 0) * 0.3 
         FROM Item_subject_focus isf
         JOIN User_subject_interest usi ON isf.subject_area_id = usi.subject_area_id
         WHERE usi.user_id = @user_id
           AND isf.item_id = i.item_id)
        +
        -- Co-author match (w3=0.1)
        (SELECT COUNT(*) * 0.1
         FROM Item_author ia
         JOIN Item i2 ON ia.reference_id = i2.reference_id
         WHERE i2.item_id = i.item_id
           AND ia.author_id IN (
               SELECT co_author_id 
               FROM Collaborated_co_authors 
               WHERE user_id = @user_id
           ))
        +
        -- Library author match (w4=0.1)
        (SELECT COUNT(*) * 0.1
         FROM User_library ul
         JOIN Item i_lib ON ul.item_id = i_lib.item_id
         JOIN Item_author ia_lib ON i_lib.reference_id = ia_lib.reference_id
         WHERE ul.user_id = @user_id
           AND ia_lib.author_id IN (
               SELECT ia_candidate.author_id
               FROM Item_author ia_candidate
               JOIN Item i_candidate ON ia_candidate.reference_id = i_candidate.reference_id
               WHERE i_candidate.item_id = i.item_id
           ))
        +
        -- Library subject match (w5=0.1)
        (SELECT COUNT(*) * 0.1
         FROM User_library ul
         JOIN Item_subject_focus isf_lib ON ul.item_id = isf_lib.item_id
         WHERE ul.user_id = @user_id
           AND isf_lib.subject_area_id IN (
               SELECT subject_area_id
               FROM Item_subject_focus
               WHERE item_id = i.item_id
           ))
    ) AS match_score
FROM Item i
LEFT JOIN (
    SELECT item_id, AVG(review_score) AS avg_score
    FROM Item_review
    GROUP BY item_id
) ir ON i.item_id = ir.item_id
-- Check if user exists and exclude items authored by the user
WHERE EXISTS (SELECT 1 FROM User_detail WHERE user_id = @user_id)  -- Key addition
  AND i.item_id NOT IN (
    SELECT i2.item_id
    FROM Item i2
    JOIN Item_author ia ON i2.reference_id = ia.reference_id
    WHERE ia.author_id = @user_id
)
ORDER BY match_score DESC;