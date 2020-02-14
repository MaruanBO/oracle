--3.Desarrollar un procedimiento que permita insertar nuevos departamentos seg�n las siguientes especificaciones:
--Se pasar� al procedimiento el nombre del departamento y la localidad.
--El procedimiento insertar� la fila nueva asignando como n�mero de departamento la decena siguiente al n�mero mayor de la tabla.
--Se incluir� gesti�n de posibles errores
set serveroutput on
CREATE OR REPLACE PROCEDURE insert_depart
                                  (
                                     insert_local   IN VARCHAR2,
                                     insert_depar_name IN VARCHAR2                                    
                                  )    AUTHID  CURRENT_USER IS
    max_depart_value VARCHAR2(500);
BEGIN
    -- Maximo de la tabla
    SELECT MAX(department_id) INTO max_depart_value FROM departments;
    -- Validaci�n de datos 
    IF insert_local IS NOT NULL THEN
        -- Insertar el maximo sumando 10 junto a los demas datos
        IF insert_depar_name IS NOT NULL THEN
        INSERT INTO departments (department_id,department_name,manager_id,location_id) VALUES 
       ( max_depart_value+10
       , insert_depar_name
       , NULL
       , insert_local
       );
       END IF;
    ELSE
        RAISE_APPLICATION_ERROR(-20002, 'Departamento o localidad no valida.');
    END IF;
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
        -- Verificac�n de valor duplicado
        Dbms_output.PUT_LINE('Valor duplicado del index');
END;
/

-- Deshabilitar la clave foranea para poder instertar datos
ALTER TABLE departments 
    DISABLE CONSTRAINT  DEPT_LOC_FK;

BEGIN
      insert_depart
                    (
                      '14',
                      '12'
                    );
END;
/