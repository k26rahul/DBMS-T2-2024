SELECT
  member_no,
  (
    SELECT
      COUNT(*)
    FROM
      book_issue
    WHERE
      book_issue.member_no = members.member_no
  ) AS issue_count
FROM
  members;