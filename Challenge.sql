--Number of Retiring Employees by Title
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles 
FROM employees as e
RIGHT JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no)

SELECT * FROM salaries

--Number of Retiring Employees by Title (No Duplicates)
SELECT DISTINCT ON (rt.emp_no) 
		rt.emp_no,
		rt.first_name,
		rt.last_name,
		rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

---Most RECENT TITLES TABLES 
SELECT COUNT(ut.title), ut.title
INTO retirement_titles
FROM unique_titles AS ut 
GROUP BY ut.title
ORDER BY count DESC;

----MENTORSHIP ELIGIBILITY 
SELECT DISTINCT ON (e.emp_no)
e.first_name,
e.last_name,
ti.title,
e.birth_date,
de.to_date,
de.from_date
--INTO mentor_ready
FROM employees as e 
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no






