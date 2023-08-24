SELECT book_title
FROM books join genres on genres.genre_id = books.genre_id
WHERE genres.genre_name = 'Fantasy';

SELECT book_title
FROM books
ORDER BY book_title ASC;

SELECT books.book_title, concat(authors.author_name, ' ', authors.author_surname)
FROM books
JOIN authors ON books.author_id = authors.author_id;

SELECT username
FROM users
WHERE email NOT LIKE '%nothing.com';

SELECT users.username, COUNT(loans.loan_id) AS loan_count
FROM users
JOIN loans ON users.user_id = loans.user_id
GROUP BY users.username
ORDER BY loan_count DESC
LIMIT 10;

SELECT users.email
FROM users JOIN loans ON loans.user_id = users.user_id
WHERE return_date BETWEEN '2023-06-01' AND '2023-08-01';

SELECT book_title,
       CASE WHEN (SELECT AVG(rating) FROM reviews WHERE reviews.book_id = books.book_id) >= 4 THEN 'High Rating' ELSE 'Low Rating' END AS rating_status
FROM books;

SELECT DISTINCT concat(authors.author_name, ' ', authors.author_surname) as Author
FROM authors 
JOIN books ON authors.author_id = books.author_id join genres on books.genre_id = genres.genre_id
WHERE genres.genre_name = 'Fantasy';

CREATE VIEW pujčeno as 
SELECT books.book_title,
       (SELECT users.username FROM users WHERE users.user_id = loans.user_id) AS borrower
FROM books
JOIN loans ON books.book_id = loans.book_id;