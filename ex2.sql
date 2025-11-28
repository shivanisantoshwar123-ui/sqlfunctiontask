select * from college2

create or replace function total_student_status(total_student int)
returns varchar as $$
declare total_student_status text;
begin
   if total_student <= 600 then total_student_status := '20 % present';
   elseif total_student <= 1300 then total_student_status := '50 % present';
   elseif total_student <= 2500 then total_student_status := '80 % present';
   else total_student_status := '100 % present';
   end if;
   return total_student_status;
end;
$$ language plpgsql


select total_student_status(200)   -----20 % present

select total_student_status(1200)    ----50 % present

select total_student_status(2000)  ----80 % present

select total_student_status(3000)     ----100 % present

select * from college

select * , total_student_status (total_student) from college

alter table college add column total_student_status varchar

select * from college

update college set total_student_status = total_student_status (total_student)

select * from college

update college set total_student = '2300' where total_student = '643'

select * from college

update college set total_student_status = total_student_status (total_student)

select * from college


