-- University Data Application Queries

-- Use university schema
USE university;

-- 1) Students, and their birthdays, of students born in September. Format the date to look like it is shown in the result set. Sort by the student's last name.

SELECT studentFirstName, studentLastName, DATE_FORMAT(studentDob,"%M %d, %Y") AS "Sept Birthdays"
FROM student
WHERE  DATE_FORMAT(studentDob,"%M %d, %Y") LIKE "%September%"
ORDER BY studentLastName;

-- 2) Student's age in years and days as of Jan. 5, 2017. Sorted from oldest to youngest. (You can assume a 365 day year and ignore leap day.) Hint: Use modulus for days left over after years. The 5th column is just the 3rd and 4th column combined with labels.

SELECT studentLastName, studentFirstName, FLOOR(DATEDIFF("2017-01-05", studentDob)/365) AS "Years", 
DATEDIFF("2017-01-05", studentDob) % 365 AS "Days", CONCAT(FLOOR(DATEDIFF("2017-01-05", studentDob)/365),"-Yrs",", ",
DATEDIFF("2017-01-05", studentDob) % 365,"-Days" ) AS "Years and Days"
FROM student
ORDER BY studentDob ASC;

-- 3) Students taught by John Jensen. Sorted by student's last name

SELECT studentFirstName, studentLastName
FROM  student s
INNER JOIN enrollment AS e
ON s.studentId = e.studentId 
INNER JOIN section AS se
ON e.sectionId = se.sectionId
INNER JOIN faculty AS f
ON se.facultyId = f.facultyId
WHERE f.facultyId = 4
ORDER BY studentLastName;

-- 4) Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.

SELECT facultyFirstName, facultyLastName 
FROM faculty f
INNER JOIN section AS s 
ON f.facultyId = s.facultyId 
INNER JOIN semester AS se 
ON  s.semesterId = se.semesterId
INNER JOIN enrollment AS e 
ON s.sectionId = e.sectionId
INNER JOIN student AS st
ON e.studentId = st.studentId 
WHERE s.semesterId = 2 AND st.studentId = 7 
ORDER BY facultyLastName;

-- 5) Students that take Econometrics in Fall 2019. Sort by student last name.

SELECT studentFirstName, studentLastName
FROM  student s
INNER JOIN enrollment AS e
ON s.studentId = e.studentId 
INNER JOIN section AS se
ON e.sectionId = se.sectionId
INNER JOIN course AS c
ON se.courseId = c.courseId 
WHERE  c.courseId = 2 AND se.semesterId = 1
ORDER BY studentLastName;

-- 6) Report showing all of Bryce Carlson's courses for Winter 2018. Sort by the name of the course.

SELECT departmentCode, courseNumber AS courseNum, courseName
FROM  department AS d
INNER JOIN course AS c
ON  d.departmentId = c.departmentId 
INNER JOIN section AS s 
ON  c.courseId = s.courseId 
INNER JOIN enrollment AS e
ON  s.sectionId = e.sectionId 
INNER JOIN  student AS se
ON  e.studentId = se.studentId
WHERE se.studentId = 7 AND s.semesterId = 2
ORDER BY  courseName;

-- 7) The number of students enrolled for Fall 2019

SELECT semesterName AS term, semesterYear, COUNT(s.studentId) AS Enrollment
FROM  student s
INNER JOIN enrollment AS e
ON  s.studentId = e.studentId 
INNER JOIN section AS se
ON e.sectionId = se.sectionId
INNER JOIN semester AS st
ON  se.semesterId = st.semesterId 
WHERE st.semesterId = 1;

-- 8) The number of courses in each college. Sort by college name.

SELECT collegeName AS colleges, COUNT(c.courseId) AS courses 
FROM college co
INNER JOIN  department AS d 
ON co.collegeId = d.collegeId
INNER JOIN course AS c 
ON  d.departmentId = c.departmentId
GROUP BY collegeName
ORDER BY collegeName;

-- 9) The total number of students each professor can teach in Winter 2018. Sort by that total number of students (teaching capacity).

SELECT  facultyFirstName, facultyLastName, SUM(sectionCapacity) AS TeachingCapacity
FROM section se
INNER JOIN  faculty AS f 
ON se.facultyId = f.facultyId
WHERE se.semesterId = 2
GROUP BY  facultyFirstName, facultyLastName
ORDER BY TeachingCapacity;

-- 10) Each student's total credit load for Fall 2019, but only students with a credit load greater than three.  Sort by credit load in descending order. 

SELECT studentLastName, studentFirstName, SUM(courseCredit) AS Credit 
FROM student s 
INNER JOIN  enrollment AS e
ON  s.studentId = e.studentId
INNER JOIN  section AS se 
ON e.sectionId = se.sectionId 
INNER JOIN course AS c 
ON se.courseId = c.courseId
WHERE se.semesterId  = 1 
GROUP BY studentLastName, studentFirstName
HAVING Credit > 3
ORDER BY Credit DESC;