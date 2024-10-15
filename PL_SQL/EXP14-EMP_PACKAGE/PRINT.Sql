-- EXPERIMENT 14 - EMPLOYEE PACKAGE

-- NAME : MILAN GEORGE MATHEW
-- ROLL NO : 39
-- DATE : 15/10/2024

-- WRITE A PL/SQL PROGRAM TO IMPLEMENT EMPLOYEE DATABASE USING PACKAGE FOR INFORMATION RETRIEVAL. CREATE A PACKAGE TO ADD EMPLOYEE, DELETE EMPLOYEE, LIST ALL EMPLOYEES AND A FUNCTION TO RETURN SALARY OF AN EMPLOYEE UP ON GIVEN ID
----------------------------------------------------------------

----------------------------------------------------------------

--TABLE DESIGN
CREATE TABLE Employees (
    Eid INT PRIMARY KEY,               
    Ename VARCHAR(50),
    Eaddress VARCHAR(100),
    Esalary DECIMAL(10, 2)
);

----------------------------------------------------------------


-- PACKAGE CREATION

CREATE OR REPLACE PACKAGE Employee_Package AS
    PROCEDURE Add_Employee(p_Eid IN INT, p_Ename IN VARCHAR2, p_Eaddress IN VARCHAR2, p_Esalary IN DECIMAL);
    PROCEDURE Delete_Employee(p_Eid IN INT);
    PROCEDURE List_Employees;
    FUNCTION Get_Salary(p_Eid IN INT) RETURN DECIMAL;
END Employee_Package;
/

---------------------------------------------------------------

-- PACKAGE BODY

CREATE OR REPLACE PACKAGE BODY Employee_Package AS

    -- Add an employee
    PROCEDURE Add_Employee(p_Eid IN INT, p_Ename IN VARCHAR2, p_Eaddress IN VARCHAR2, p_Esalary IN DECIMAL) AS
    BEGIN
        INSERT INTO Employees (Eid, Ename, Eaddress, Esalary)
        VALUES (p_Eid, p_Ename, p_Eaddress, p_Esalary);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Employee ' || p_Ename || ' added successfully with ID ' || p_Eid || '.');
    END Add_Employee;

    -- Delete an employee
    PROCEDURE Delete_Employee(p_Eid IN INT) AS
    BEGIN
        DELETE FROM Employees WHERE Eid = p_Eid;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_Eid || ' deleted successfully.');
    END Delete_Employee;

    -- List all employees
    PROCEDURE List_Employees AS
        CURSOR emp_cursor IS
            SELECT Eid, Ename, Eaddress, Esalary FROM Employees;
        v_emp emp_cursor%ROWTYPE;
    BEGIN
        OPEN emp_cursor;
        LOOP
            FETCH emp_cursor INTO v_emp;
            EXIT WHEN emp_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('ID: ' || v_emp.Eid || ', Name: ' || v_emp.Ename || ', Address: ' || v_emp.Eaddress || ', Salary: ' || v_emp.Esalary);
        END LOOP;
        CLOSE emp_cursor;
    END List_Employees;

    -- Get salary of an employee
    FUNCTION Get_Salary(p_Eid IN INT) RETURN DECIMAL AS
        v_salary DECIMAL(10, 2);
    BEGIN
        SELECT Esalary INTO v_salary FROM Employees WHERE Eid = p_Eid;
        RETURN v_salary;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Employee with ID ' || p_Eid || ' not found.');
            RETURN NULL;
    END Get_Salary;

END Employee_Package;
/

---------------------------------------------------------------


--PROGRAM

SET SERVEROUTPUT ON;

DECLARE
    v_salary DECIMAL(10, 2);
    v_emp_id_for_salary INT := &employee_id_for_salary;  -- Prompt for EmployeesID to get salary
    v_emp_id_for_deletion INT := &employee_id_for_deletion;  -- Prompt for EmployeesID to delete
BEGIN
    -- Add employees
    Employee_Package.Add_Employee(1, 'Alice Johnson', '101 Maple St', 55000);
    Employee_Package.Add_Employee(2, 'Bob Smith', '202 Oak St', 60000);
    Employee_Package.Add_Employee(3, 'Charlie Brown', '303 Pine St', 50000);
    
    -- List all employees
    Employee_Package.List_Employees;
    
    -- Get salary of an employee
    v_salary := Employee_Package.Get_Salary(v_emp_id_for_salary);  -- Get salary for user-specified EmployeeID
    IF v_salary IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Salary of EmployeesID ' || v_emp_id_for_salary || ': ' || v_salary);
    END IF;
    
    -- Delete an employee
    Employee_Package.Delete_Employee(v_emp_id_for_deletion);  -- Delete employee with user-specified ID
    
    -- List employees again
    Employee_Package.List_Employees;
END;
/
    

----------------------------------------

--OUTPUT
SQL> @/home/dspl06/Milan/DBMS_LAB_S5/PL_SQL/EXP14-EMP_PACKAGE/db.sql

Table created.

SQL> @/home/dspl06/Milan/DBMS_LAB_S5/PL_SQL/EXP14-EMP_PACKAGE/packageinit.sql

Package created.

SQL> @/home/dspl06/Milan/DBMS_LAB_S5/PL_SQL/EXP14-EMP_PACKAGE/package.sql

Package body created.

SQL> @/home/dspl06/Milan/DBMS_LAB_S5/PL_SQL/EXP14-EMP_PACKAGE/prog.sql
Enter value for employee_id_for_salary: 2
old   3:     v_emp_id_for_salary INT := &employee_id_for_salary;  -- Prompt for EmployeesID to get salary
new   3:     v_emp_id_for_salary INT := 2;  -- Prompt for EmployeesID to get salary
Enter value for employee_id_for_deletion: 3
old   4:     v_emp_id_for_deletion INT := &employee_id_for_deletion;  -- Prompt for EmployeesID to delete
new   4:     v_emp_id_for_deletion INT := 3;  -- Prompt for EmployeesID to delete
Employee Alice Johnson added successfully with ID 1.
Employee Bob Smith added successfully with ID 2.
Employee Charlie Brown added successfully with ID 3.
ID: 1, Name: Alice Johnson, Address: 101 Maple St, Salary: 55000
ID: 2, Name: Bob Smith, Address: 202 Oak St, Salary: 60000
ID: 3, Name: Charlie Brown, Address: 303 Pine St, Salary: 50000
Salary of EmployeesID 2: 60000
Employee with ID 3 deleted successfully.
ID: 1, Name: Alice Johnson, Address: 101 Maple St, Salary: 55000
ID: 2, Name: Bob Smith, Address: 202 Oak St, Salary: 60000

PL/SQL procedure successfully completed.

---------------------------------------------------
