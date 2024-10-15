SET SERVEROUTPUT ON
create or replace trigger tri_st
before insert or update of  subj1,subj2,subj3 on Student3
for each row

DECLARE
	v_tot number(5,2);
	v_avg number(5,2);
BEGIN
	v_tot:=(:NEW.subj1+:NEW.subj2+:NEW.subj3);
	v_avg:=v_tot/3;
	:NEW.total:=v_tot;
	:NEW.avg:=v_avg;
END;
/