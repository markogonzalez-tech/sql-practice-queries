-- Advanced SQL Practice Queries
-- MySQL Exercises

-- 1. Employees with their current salary
SELECT 
    e.nombre,
    e.apellido,
    s.salario
FROM empleados e
JOIN salarios s 
ON e.id_empleado = s.id_empleado
WHERE s.hasta_fecha = '9999-01-01';



-- 2. Employees and their current department
SELECT 
    e.nombre,
    e.apellido,
    d.nombre_dpto
FROM empleados e
JOIN dpto_empresa de 
ON e.id_empleado = de.id_empleado
JOIN departamentos d 
ON de.id_dpto = d.id_dpto
WHERE de.hasta_fecha = '9999-01-01';



-- 3. Employees earning more than the company average salary
SELECT 
    e.nombre,
    e.apellido,
    s.salario
FROM empleados e
JOIN salarios s 
ON e.id_empleado = s.id_empleado
WHERE s.salario > (
    SELECT AVG(salario)
    FROM salarios
)
AND s.hasta_fecha = '9999-01-01';



-- 4. Number of employees per department
SELECT 
    d.nombre_dpto,
    COUNT(de.id_empleado) AS total_empleados
FROM departamentos d
JOIN dpto_empresa de 
ON d.id_dpto = de.id_dpto
GROUP BY d.nombre_dpto
ORDER BY total_empleados DESC;



-- 5. Employees earning more than 100000 with their department
SELECT 
    e.nombre,
    e.apellido,
    d.nombre_dpto,
    s.salario
FROM empleados e
JOIN salarios s 
ON e.id_empleado = s.id_empleado
JOIN dpto_empresa de 
ON e.id_empleado = de.id_empleado
JOIN departamentos d 
ON de.id_dpto = d.id_dpto
WHERE s.salario > 100000
AND s.hasta_fecha = '9999-01-01'
AND de.hasta_fecha = '9999-01-01'
ORDER BY e.nombre ASC;
