
-- Real World SQL Queries
-- 1. Highest paid employee per department
SELECT d.nombre_dpto, MAX(s.salario) AS max_salary
FROM departamentos d
JOIN dpto_empresa de ON d.id_dpto = de.id_dpto
JOIN salarios s ON de.id_empleado = s.id_empleado
WHERE s.hasta_fecha = '9999-01-01'
GROUP BY d.nombre_dpto;


-- 2. Employees without current department
SELECT e.nombre, e.apellido
FROM empleados e
LEFT JOIN dpto_empresa de 
ON e.id_empleado = de.id_empleado 
AND de.hasta_fecha = '9999-01-01'
WHERE de.id_empleado IS NULL;


-- 3. Employees with salary above department average
SELECT e.nombre, e.apellido, s.salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
WHERE s.salario > (
    SELECT AVG(s2.salario)
    FROM salarios s2
)
AND s.hasta_fecha = '9999-01-01';
