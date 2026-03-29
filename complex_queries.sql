-- Employees with highest salary per department
SELECT d.nombre_dpto, e.nombre, s.salario
FROM empleados e
JOIN salarios s ON e.id_empleado = s.id_empleado
JOIN dpto_empresa de ON e.id_empleado = de.id_empleado
JOIN departamentos d ON de.id_dpto = d.id_dpto
WHERE s.salario = (
    SELECT MAX(s2.salario)
    FROM salarios s2
    WHERE s2.id_empleado = e.id_empleado
)
AND s.hasta_fecha = '9999-01-01';


-- Employees that never changed department
SELECT id_empleado
FROM dpto_empresa
GROUP BY id_empleado
HAVING COUNT(DISTINCT id_dpto) = 1;
