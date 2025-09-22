/* Easy-level problem */
CREATE TABLE AUTHOR1 (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(100),
    COUNTRY VARCHAR(50)
);

CREATE TABLE BOOKS1 (
    BOOK_ID INT PRIMARY KEY,
    BOOK_NAME VARCHAR(100),
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHOR1(AUTHOR_ID)
);

INSERT INTO AUTHOR1 (AUTHOR_ID, AUTHOR_NAME, COUNTRY) VALUES
(1, 'J.K. Rowling', 'United Kingdom'),
(2, 'Chinua Achebe', 'Nigeria'),
(3, 'Arundhati Roy', 'India'),
(4, 'Leo Tolstoy', 'Russia');

INSERT INTO BOOKS1 (BOOK_ID, BOOK_NAME, AUTHOR_ID) VALUES
(101, 'Things Fall Apart', 2),
(102, 'Harry Potter and the Sorcerers Stone', 1),
(103, 'The God of Small Things', 3);


SELECT 
    B.BOOK_NAME,
    A.AUTHOR_NAME,
    A.COUNTRY
FROM 
    BOOKS1 B
INNER JOIN 
    AUTHOR1 A ON B.AUTHOR_ID = A.AUTHOR_ID;


/*Medium Level Problem*/
	CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY,
    DEPT_NAME VARCHAR(100)
);

CREATE TABLE COURSE (
    COURSE_ID INT PRIMARY KEY,
    COURSE_NAME VARCHAR(100),
    DEPT_ID INT,
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID)
);

INSERT INTO DEPARTMENT (DEPT_ID, DEPT_NAME) VALUES
(1, 'Computer Science'),
(2, 'Electronics'),
(3, 'Mathematics'),
(4, 'Communication'),
(5, 'General Studies');

INSERT INTO COURSE (COURSE_ID, COURSE_NAME, DEPT_ID) VALUES
(101, 'Operating Systems', 1),
(102, 'Computer Networks', 1),
(103, 'Competitive Programming', 1),
(104, 'Microcontroller', 2),
(105, 'Embedded Systems', 2),
(106, 'Mathematics I', 3),
(107, 'Mathematics II', 3),
(108, 'Communication Skills', 4),
(109, 'English Literature', 4),
(110, 'DAA', 1);

SELECT 
    DEPT_NAME
FROM 
    DEPARTMENT
WHERE 
    (SELECT COUNT(*) 
     FROM COURSE 
     WHERE COURSE.DEPT_ID = DEPARTMENT.DEPT_ID) > 2;

