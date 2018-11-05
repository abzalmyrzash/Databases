CREATE TABLE locations(
	location_id SERIAL PRIMARY KEY,
	street_address VARCHAR(25),
	postal_code VARCHAR(12),
	city VARCHAR(30),
	state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email varchar(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  manager_id INTEGER REFERENCES employees,
  department_id INTEGER REFERENCES departments
);

--3
SELECT first_name, last_name, employees.department_id, department_name 
	FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id;

--4
SELECT first_name, last_name, employees.department_id, department_name
	FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
		WHERE departments.department_id = 40 OR departments.department_id = 80;

--5
SELECT first_name, last_name, department_name, city, state_province
	FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
        JOIN locations ON departments.location_id = locations.location_id;

--6
SELECT d1.department_id, d1.department_name, d2.budget, d2.location_id
	FROM departments d1 JOIN departments d2 USING (department_id);

--7
SELECT first_name, last_name, employees.department_id, department_name
	FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id
		WHERE employees.department_id IS NULL OR employees.department_id IS NOT NULL;