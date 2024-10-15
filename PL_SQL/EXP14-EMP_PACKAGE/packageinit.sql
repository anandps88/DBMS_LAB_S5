
CREATE OR REPLACE PACKAGE Employee_Package AS
    PROCEDURE Add_Employee(p_Eid IN INT, p_Ename IN VARCHAR2, p_Eaddress IN VARCHAR2, p_Esalary IN DECIMAL);
    PROCEDURE Delete_Employee(p_Eid IN INT);
    PROCEDURE List_Employees;
    FUNCTION Get_Salary(p_Eid IN INT) RETURN DECIMAL;
END Employee_Package;
/
