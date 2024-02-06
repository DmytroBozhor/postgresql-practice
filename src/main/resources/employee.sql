CREATE TABLE employee
(
    id         BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(128),
    last_name  VARCHAR(128),
    salary     BIGINT,
    company_id BIGINT REFERENCES company (id)
);

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ban', 'Kruz', 1500, 1),
       ('Ariana', 'Grand', 500, 2),
       ('Folk', 'Benzo', 1000, 3),
       ('Law', 'Trafalgar', 2000, 1),
       ('Robin', 'Rafa', 2500, 2),
       ('Zoro', 'Roronoa', 1500, 3);


-- SELECT first_name || ' ' || employee.last_name AS fio        does not handle null values
-- SELECT concat(first_name, ' ', employee.last_name) AS fio,   handles null values correctly

SELECT concat(first_name, ' ', employee.last_name) AS fio,
       salary
FROM employee
ORDER BY fio;

SELECT avg(salary)
FROM (SELECT salary
      FROM employee
      ORDER BY salary
      LIMIT 2) as two_lowest_salaries;

INSERT INTO employee (first_name, last_name, salary, company_id)
VALUES ('Ban', 'Davinson', 1000, 2),
       ('Hime', 'Roronoa', 2000, 1);

SELECT DISTINCT first_name,
                salary
FROM employee
WHERE salary >= 1500
ORDER BY salary;

INSERT INTO company (name, date)
VALUES ('Microsoft', '2012-05-06');

-- Calculate how many employees work for a specific company
-- and at the same time don't show companies that have less than 1 employee
SELECT count(e.id),
       c.name
FROM employee e
         RIGHT JOIN company c ON c.id = e.company_id
GROUP BY c.name
HAVING count(e.id) >= 1
ORDER BY c.name;

CREATE VIEW lowest_two_salaries AS
SELECT salary
FROM employee
ORDER BY salary
LIMIT 2;

CREATE MATERIALIZED VIEW materialized_lowest_two_salaries AS
SELECT salary
FROM employee
ORDER BY salary
LIMIT 2;

SELECT avg(salary)
FROM lowest_two_salaries;

REFRESH MATERIALIZED VIEW materialized_lowest_two_salaries;
