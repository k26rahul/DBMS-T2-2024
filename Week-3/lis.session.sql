-- Week 3: Graded Question 4
--  Write an SQL statement to find roll_no and member_no of all students who have issued (borrowed) books between '2021-08-02' and '2021-08-07'.
SELECT
  roll_no,
  member_no
FROM
  book_issue
  INNER JOIN members USING (member_no)
WHERE
  doi BETWEEN '2021-08-02' AND '2021-08-07';

-- Week 3: Graded Question 5
-- Write an SQL statement to find the book titles and the number of copies of the books which has the word 'Database' in their title.
SELECT
  isbn_no,
  count(isbn_no)
from
  book_copies
GROUP BY
  isbn_no;

SELECT
  title,
  copies
FROM
  book_catalogue as bc,
  (
    SELECT
      isbn_no,
      count(isbn_no) as copies
    from
      book_copies
    GROUP BY
      isbn_no
  ) AS copies_sq
WHERE
  title like '%Database%'
  AND copies_sq.isbn_no = bc.isbn_no;

SELECT
  *
FROM
  book_catalogue
WHERE
  title like '%Database%';

SELECT
  isbn_no,
  count(isbn_no)
FROM
  book_copies
  INNER JOIN book_catalogue USING (isbn_no)
WHERE
  title like '%Database%'
GROUP BY
  isbn_no;