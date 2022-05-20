-- INICIO DEL CHALLENGE
--______________________________________________________________
-- DELIVERABLE 1
-- EMployee database
SELECT 	e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date		
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use DiSctinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
		first_name,
		last_name,
		title
INTO title_unique
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no ASC;


-- Employees by their most recent job title who are about to retire
SELECT COUNT(title), title
INTO retiring_title
FROM title_unique
GROUP BY title
ORDER BY count(title) DESC;

SELECT * FROM retiring_title;

--_______________________________________________________________

-- DELIVERABLE 2
-- Mentorship elegibilty program

SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		ti.title
INTO mentorship_elegibity
FROM employees AS e
LEFT JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;