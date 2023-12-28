-- Задание 3
SELECT Groups.name as 'group', Students.name, Students.budget
from Groups, Students
where Groups.id = Students.group_id
order by Groups.name, Students.name;

--
SELECT Students.name, Groups.name as 'group', Directions.name as 'direction'
from Students
JOIN Groups
on Students.group_id = Groups.id
join Directions
on Groups.direction_id = Directions.id
where Students.name LIKE 'К%'

--
SELECT CONCAT(
          SUBSTRING(Students.name, 1, INSTR(Students.name,' ')+1), '.',
          SUBSTRING(SUBSTRING(Students.name, INSTR(Students.name,' ')+1),
                    INSTR(SUBSTRING(Students.name, INSTR(Students.name,' ')+1),' ')+1, 
                    1), '.') as 'name',
           DAY(Students.date_of_birth) as 'day',
           MONTHNAME(Students.date_of_birth) as 'month',
           Groups.name AS 'group',
           Directions.name as 'direction'
FROM Students
join Groups ON Groups.id = Students.group_id
JOIN Directions ON Directions.id = Groups.direction_id

--
SELECT Students.name,
(YEAR(CURRENT_DATE)-YEAR(date_of_birth))-(RIGHT(CURRENT_DATE,5)<RIGHT(date_of_birth,5)) AS 'age'
FROM Students
ORDER BY age

--
SELECT Students.name,
		DAY(Students.date_of_birth) AS 'day',
		MONTHNAME(Students.date_of_birth) AS 'month'
FROM Students
WHERE MONTH(Students.date_of_birth) = MONTH(CURRENT_DATE)

--
SELECT Directions.name, COUNT(Students.id)
FROM Directions
JOIN Groups ON Groups.direction_id = Directions.id
JOIN Students ON Students.group_id = Groups.id
GROUP BY Directions.id

--
SELECT Groups.name AS 'group',
		Directions.name as 'direction',
        COUNT(*) AS 'всего',
		SUM(Students.budget = true) AS 'бюджет',
        SUM(Students.budget = false) AS 'внебюджет'
FROM Students
JOIN Groups ON Groups.id = Students.group_id
JOIN Directions ON Groups.direction_id = Directions.id
GROUP BY group_id


-- Задание 5
SELECT Students.name, Subjects.name AS 'subject', Groups.name AS 'group', Teachers.name AS 'teacher'
FROM subs_teachs_dirs
JOIN Subjects ON Subjects.id = subs_teachs_dirs.subject_id
JOIN Directions ON Directions.id = subs_teachs_dirs.direction_id
JOIN Teachers ON Teachers.id = subs_teachs_dirs.teacher_id
JOIN Groups ON Groups.direction_id = Directions.id
JOIN Students ON Students.group_id = Groups.id
ORDER BY Groups.name

SELECT Subjects.name AS 'subject',COUNT(*) AS cnt
FROM subs_teachs_dirs
JOIN Subjects ON Subjects.id = subs_teachs_dirs.subject_id
JOIN Directions ON Directions.id = subs_teachs_dirs.direction_id
JOIN Groups ON Groups.direction_id = Directions.id
JOIN Students ON Students.group_id = Groups.id
GROUP BY Subjects.id
ORDER BY cnt DESC

SELECT Teachers.name AS 'subject',COUNT(*) AS cnt
FROM subs_teachs_dirs
JOIN Teachers ON Teachers.id = subs_teachs_dirs.teacher_id
JOIN Directions ON Directions.id = subs_teachs_dirs.direction_id
JOIN Groups ON Groups.direction_id = Directions.id
JOIN Students ON Students.group_id = Groups.id
GROUP BY Teachers.id
ORDER BY cnt DESC

SELECT Subjects.name, (SUM(Marks.mark>2) *100.0 / COUNT(*)) as 'piece' FROM Subjects
JOIN subs_teachs_dirs ON subs_teachs_dirs.subject_id = Subjects.id
JOIN Marks ON Marks.std_id = subs_teachs_dirs.id
GROUP BY Subjects.name

SELECT Subjects.name, AVG(Marks.mark) as 'avg' FROM Subjects
JOIN subs_teachs_dirs ON subs_teachs_dirs.subject_id = Subjects.id
JOIN Marks ON Marks.std_id = subs_teachs_dirs.id
WHERE Marks.mark > 2
GROUP BY Subjects.name

SELECT Groups.name AS 'group', AVG(Marks.mark) as 'avg' FROM Groups
JOIN Students ON Students.group_id = Groups.id
JOIN Marks ON Marks.student_id = Students.id
GROUP BY Groups.name
ORDER BY AVG(Marks.mark) DESC

SELECT Students.name, AVG(Marks.mark)
FROM Students
JOIN Marks ON Marks.student_id = Students.id
GROUP BY Students.name
HAVING AVG(Marks.mark) = 5.0

SELECT Students.name
FROM Students
JOIN Marks ON Marks.student_id = Students.id
WHERE Marks.mark = 2
GROUP BY Students.name
HAVING COUNT(*)>1


-- Задание 7
SELECT Subjects.name, lessons_schedule.date, COUNT(*)
FROM Subjects
JOIN subs_teachs_dirs ON subs_teachs_dirs.subject_id = Subjects.id
JOIN lessons_schedule ON lessons_schedule.subject_id = subs_teachs_dirs.id
JOIN attendance ON attendance.scedule_id = lessons_schedule.id
WHERE attendance.presense=1
GROUP BY Subjects.id, lessons_schedule.id


SELECT subjects.name, lessons_schedule.date, COUNT(*)
FROM subjects
JOIN subs_teachs_dirs ON subs_teachs_dirs.subject_id = subjects.id
JOIN lessons_schedule ON lessons_schedule.subject_id = subs_teachs_dirs.id
JOIN attendance ON attendance.scedule_id = lessons_schedule.id
WHERE attendance.presense=0
GROUP BY subjects.id, lessons_schedule.id


SELECT Teachers.name, lessons_schedule.date, COUNT(*)
FROM Teachers
JOIN subs_teachs_dirs ON subs_teachs_dirs.teacher_id = Teachers.id
JOIN lessons_schedule ON lessons_schedule.subject_id = subs_teachs_dirs.id
JOIN attendance ON attendance.scedule_id = lessons_schedule.id
WHERE attendance.presense=1
GROUP BY Teachers.id, lessons_schedule.id


SELECT Students.name, Subjects.name, lessons_schedule.date, COUNT(*)*1.5
FROM Students
JOIN attendance ON attendance.student_id = Students.id
JOIN lessons_schedule ON lessons_schedule.id = attendance.scedule_id
JOIN subs_teachs_dirs ON subs_teachs_dirs.id = lessons_schedule.subject_id
JOIN Subjects ON Subjects.id = subs_teachs_dirs.subject_id
WHERE attendance.presense=1
GROUP BY Students.id, Subjects.id

