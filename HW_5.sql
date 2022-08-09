SELECT number, (SELECT name FROM courses WHERE courses.id = streams.course_id)
	AS name_course, students_amount FROM streams WHERE 
		students_amount >= 40; 



SELECT stream_id, (SELECT name FROM courses WHERE courses.id = 	(SELECT course_id FROM streams WHERE streams.id = grades_old.stream_id)) AS 	name_course, (SELECT surname || ' ' || name FROM teachers 	WHERE teachers.id = grades_old.teacher_id) as fio, perfomance FROM grades_old 	ORDER BY perfomance ASC LIMIT 2; 



SELECT teacher_id, AVG(perfomance) FROM grades_old WHERE 	grades_old.teacher_id = ( SELECT id FROM teachers WHERE 	surname = 'Савельев' AND name = 'Николай'); 



SELECT stream_id, (SELECT surname || " " || name FROM teachers 	WHERE teachers.id = grades_old.teacher_id) FROM 	grades_old WHERE teacher_id = (SELECT id FROM teachers 	WHERE surname = 'Петрова' AND name = 'Наталья')

UNION ALL 

SELECT stream_id, (SELECT surname || " " || name FROM teachers 	WHERE teachers.id = grades_old.teacher_id) FROM 	grades_old WHERE perfomance < 4.8;



SELECT MAX(avg_per) - MIN(avg_per) FROM (SELECT 	AVG(perfomance) FROM grades_old GROUP BY teacher_id);


