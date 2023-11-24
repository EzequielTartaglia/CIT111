USE university;
INSERT INTO college
(collegeName)
VALUES 
("College of Physical Science and Engineering"),
("College of Business and Communication"),
("College of Language and Letters");

INSERT INTO department
(departmentName, departmentCode, collegeId)
VALUES
("Computer Information Technology", "CIT", 1),
("Ecomonics", "ECON", 2),
("Humanities and Philosophy", "HUM", 3);

INSERT INTO course
(courseNumber, courseName, courseCredit, departmentId)
VALUES 
(111, "Intro to Databases", 3, 1),
(388, "Econometrics", 4, 2),
(150, "Micro Ecomonics", 3, 2),
(376, "Classical Heritage", 2, 3);

INSERT INTO faculty 
(facultyFirstName, facultyLastName)
VALUES 
("Marty","Morring"),
("Nate", "Nathan"),
("Ben", "Barrus"),
("John", "Jensen"),
("Bill", "Barney");

INSERT INTO semester
(semesterName, semesterYear)
VALUES 
("Fall", 2019),
("Winter", 2018);

INSERT INTO section
(sectionNumber, sectionCapacity, courseId, facultyId, semesterId)
VALUES 
(1, 30, 1, 1, 1),
(1, 50, 3, 2, 1),
(2, 50, 3, 2, 1),
(1, 35, 2, 3, 1),
(1, 30, 4, 4, 1),
(2, 30, 1, 1, 2),
(3, 35, 1, 5, 2),
(1, 50, 3, 2, 2),
(2, 50, 3, 2, 2),
(1, 30, 4, 4, 2);

INSERT INTO student 
(studentFirstName, studentLastName, studentGender, studentCity, studentState, studentDob)
VALUES 
("Paul", "Miller", "M", "Dallas", "TX", "1996-02-22" ),
("Katie", "Smith", "F", "Provo", "UT", "1995-07-22"),
("Kelly", "Jones", "F", "Provo", "UT", "1998-06-22"),
("Devon", "Merrill", "M", "Mesa", "AZ", "2000-07-22"),
("Mandy", "Murdock", "F", "Topeka", "KS", "1996-11-22"),
("Alece", "Adams", "F", "Rigby", "ID", "1997-05-22"),
("Bryce", "Carlson", "M", "Bozeman", "MT", "1997-11-22"),
("Preston", "Larson", "M", "Decatur", "TN", "1996-09-22"),
("Julia", "Madsen", "F", "Rexburg", "ID", "1998-09-22"),
("Susan", "Sorensen", "F", "Mesa", "AZ", "1998-08-09");

INSERT INTO enrollment
(sectionId, studentId)
VALUES 
(7, 6),
(6, 7), 
(8, 7),
(10, 7),
(5, 4),
(9, 9),
(4, 2),
(4, 3),
(4, 5),
(5, 5),
(1, 1),
(3, 1),
(9, 8),
(6, 10);


