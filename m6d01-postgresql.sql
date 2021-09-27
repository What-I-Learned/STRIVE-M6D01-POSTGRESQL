DROP TABLE IF EXISTS public.blogs CASCADE;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;

CREATE TABLE
IF NOT EXISTS
authors(
			author_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
			name VARCHAR(255) NOT NULL,
			last_name VARCHAR (50) NOT NULL,
			birth_year INTEGER NOT NULL,
			country VARCHAR(255) NOT NULL
);

INSERT INTO authors(name,last_name,birth_year,country)VALUES('Daniel Gerhard','Brown',1964,'United States');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('Agatha','Christie',1890,'United Kingdom');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('Paulo','Coelho',1947,'Brazil');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('Ken ','Follet',1949,'United Kingdom');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('John','Grisham',1955,'United States');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('Stephen','King',1947,'United States');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('Haruki','Murakami',1949,'Japan');
INSERT INTO authors(name,last_name,birth_year,country)VALUES('James','Patterson',1947,'United States');


CREATE TABLE
IF NOT EXISTS
books(
			book_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
			name VARCHAR(255) NOT NULL,
			category VARCHAR (50) NOT NULL,
			cover TEXT NOT NULL,
            author INTEGER,
			created_at TIMESTAMPTZ DEFAULT NOW(),
			updated_at TIMESTAMPTZ DEFAULT NOW(),
			published_at TIMESTAMPTZ DEFAULT NOW(),
	FOREIGN KEY(author) REFERENCES authors(author_id)
);

INSERT INTO books(name,category,cover,author)VALUES('Angels & Demons','Novel','https://www.booksradar.com/images/7/angels-demons.jpg',1);
INSERT INTO books(name,category,cover,author)VALUES('The Da Vinci Code','Novel','https://www.booksradar.com/images/8/the-da-vinci-code.jpg',1);
INSERT INTO books(name,category,cover,author)VALUES('The Lost Symbol','Novel','https://www.booksradar.com/images/9/the-lost-symbol.jpg',1);

INSERT INTO books(name,category,cover,author)VALUES('THE MURDER OF ROGER ACKROYD','Novel','https://s2982.pcdn.co/wp-content/uploads/2016/06/the-murder-of-roger-ackroyd.jpg.webp',2);
INSERT INTO books(name,category,cover,author)VALUES('MURDER ON THE ORIENT EXPRESS','Novel','https://s2982.pcdn.co/wp-content/uploads/2018/01/murder-on-the-orient-express.png.webp',2);
INSERT INTO books(name,category,cover,author)VALUES('AND THEN THERE WERE NONE','Novel','https://s2982.pcdn.co/wp-content/uploads/2017/06/and-then-there-were-none-agatha-christie.jpg.webp',2);

INSERT INTO books(name,category,cover,author)VALUES('The Alchemist','Self-Development','https://m.media-amazon.com/images/I/41PZiLdBtpL._SL350_.jpg',3);
INSERT INTO books(name,category,cover,author)VALUES('The Archer','Self-Development','https://img.thriftbooks.com/api/images/i/m/1A6E5B1CEBB4E2E053F40622F7AD822D62A1527B.jpg',3);
INSERT INTO books(name,category,cover,author)VALUES('Like the Flowing River','Stories','https://m.media-amazon.com/images/I/41sO5RY0KFL._SL350_.jpg',3);

INSERT INTO books(name,category,cover,author)VALUES('The Pillars of the Earth','Novel','https://m.media-amazon.com/images/I/51tevKLo8iS._SL500_.jpg',4);
INSERT INTO books(name,category,cover,author)VALUES('Winter of the World','Novel','https://img.thriftbooks.com/api/images/l/3c7b6e26f344393ca532db87bf310ae27e790252.jpg',4);
INSERT INTO books(name,category,cover,author)VALUES('A Dangerous Fortune','Novel','https://m.media-amazon.com/images/I/51g46ahAVdL._SL500_.jpg',4);


-- Write an update query to update  authors birth year
UPDATE pubic.authors SET birth_year = 1989 WHERE uthor_id = 1

UPDATE public.books
SET cover = 'http' 
WHERE book_id = 1;


-- SELECT * FROM public.blogs;
SELECT category FROM public.books;

SELECT * FROM public.books WHERE lower(name) SIMILAR TO '[a-f]%'
SELECT * FROM public.books WHERE lower(name) LIKE TO '%winter%'
SELECT * FROM public.authors WHERE birth_year  >= 2021-60
SELECT * FROM public.authors WHERE birth_year  < 2021-40
SELECT category,published_at FROM public.books;

SELECT COUNT(*) FROM public.books;
SELECT NAME,birth_year, 2021-birth_year AS age FROM authors ORDER BY age ASC; 

-- DELETE
DELETE FROM public.authors WHERE lower(country)='united states'
DELETE FROM public.books WHERE lower(category)='united states'
DELETE FROM public.authors WHERE lower(last_name)='a%'