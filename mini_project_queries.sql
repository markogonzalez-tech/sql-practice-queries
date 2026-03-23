-- Mini Project: Employee Analysis

-- 1. Employees with their salary and department
SELECT 
    e.nombre,
    e.apellido,
    d.nombre_dpto,
    s.salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
JOIN dpto_empresa de ON e.id_empleado = de.id_empleado
JOIN departamentos d ON de.id_dpto = d.id_dpto
WHERE s.hasta_fecha = '9999-01-01'
AND de.hasta_fecha = '9999-01-01';


-- 2. Top 5 highest salaries
SELECT 
    e.nombre,
    e.apellido,
    s.salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
WHERE s.hasta_fecha = '9999-01-01'
ORDER BY s.salario DESC
LIMIT 5;


-- 3. Average salary per department
SELECT 
    d.nombre_dpto,
    AVG(s.salario) AS avg_salary
FROM departamentos d
JOIN dpto_empresa de ON d.id_dpto = de.id_dpto
JOIN salarios s ON de.id_empleado = s.id_empleado
WHERE s.hasta_fecha = '9999-01-01'
GROUP BY d.nombre_dpto
ORDER BY avg_salary DESC;
