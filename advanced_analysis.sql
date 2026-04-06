-- Employees with the same salary as another employee
SELECT e1.nombre, e1.apellido, s1.salario
FROM empleados e1
JOIN salarios s1 ON e1.id_empleado = s1.id_empleado
WHERE s1.salario IN (
    SELECT salario
    FROM salarios
    GROUP BY salario
    HAVING COUNT(*) > 1
);
-- Top 3 highest salaries
SELECT nombre, apellido, salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
WHERE s.hasta_fecha = '9999-01-01'
ORDER BY salario DESC
LIMIT 3;
