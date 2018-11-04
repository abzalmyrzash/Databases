--1
CREATE INDEX nameIndex ON countries(name);

--2
CREATE INDEX fullNameIndex ON employees(name, surname);

--3
CREATE INDEX salaryIndex ON employees(salary);

--4
CREATE INDEX substringIndex ON employees(substring(name from 1 to 4));

--5
CREATE INDEX departIndex ON employees(department_id, salary);
CREATE INDEX budgetIndex ON departments(department_id, budget);