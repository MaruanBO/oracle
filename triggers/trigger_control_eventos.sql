--los trabajos con la comision inferior a 0.2 disminuye su salario
--Despues de cada insercción de datos se inserte verifica si la comision es inferior a 0.2, se debe de realizar mediante la inserccion ya que si lo hacemos mediante una actualización tendremos el problema de la tabla mutada
--lanzar el trigger en la misma tabla que se quiere modificar y por 
CREATE OR REPLACE TRIGGER low_salary_commision 
BEFORE INSERT ON employees
FOR EACH ROW 
WHEN (old.commission_pct <= 0.2)
--declare
--PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 
   update employees set salary = :new.salary - 20;
   COMMIT;
END;
/

 ALTER TABLE state_lineages INITRANS 8;
 
select * from employees where department_id = 60;

insert into employees (employee_id,first_name,last_name,email,salary,hire_date,job_id,department_id,commission_pct) values (17,'test','test','ww7',100,'12/12/12',12,60,0.1);

update employees
set salary = 2000
where employee_id= 173;

