-- desafio proposto, criei algumas queries de pesquisa:

-- Quais funcionários trabalham em cada projeto?

SELECT e.Fname, e.Lname, p.Pname, w.Hours
FROM employee e
JOIN works_on w ON e.Ssn = w.Essn
JOIN project p ON w.Pno = p.Pnumber
ORDER BY p.Pname, e.Lname;

-- Quem são os supervisores de cada funcionário?

SELECT e.Fname AS Funcionario, e.Lname, s.Fname AS Supervisor, s.Lname
FROM employee e
LEFT JOIN employee s ON e.Super_ssn = s.Ssn
ORDER BY Supervisor;

-- Quantas horas cada funcionário trabalha no total (Somando todos projetos)?

SELECT e.Fname, e.Lname, SUM(w.Hours) AS Total_Horas
FROM employee e
JOIN works_on w ON e.Ssn = w.Essn
GROUP BY e.Fname, e.Lname
ORDER BY Total_Horas DESC;

-- Verifique se há algum colaborador sem gerente?

SELECT Fname, Lname, Ssn
FROM employee
WHERE Super_ssn IS NULL;

-- James é gerente. 
