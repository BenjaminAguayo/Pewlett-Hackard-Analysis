-- Determine retirement eligibity
SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Determine retirement eligibity 1952
SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Determine retirement eligibity 1955 (23,104)
SELECT count(first_name)
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';


-- Retirement eligibility, entre 1952 y 1955, además contratados entre 1985 y 1988
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Sólo conteo -> 41,380 empleados con esas caraterísticas.
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Crea una nueva tabla llamada "retirement_info y salva la información dentro de ella"
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Visualizar tabla
SELECT * FROM retirement_info;
