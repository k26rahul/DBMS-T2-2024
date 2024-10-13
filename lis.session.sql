SELECT DISTINCT
  title,
  count(*)
FROM
  book_catalogue
  JOIN book_copies USING (ISBN_no)
WHERE
  title LIKE '%Advanced%'
GROUP BY
  title