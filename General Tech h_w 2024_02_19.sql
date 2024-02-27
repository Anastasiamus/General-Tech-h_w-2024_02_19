-- 1.Повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%. Записать данные в новое поле new_salary. Поле создавать не нужно, используем AS. 

select salary,
	case
		when department = 'sales' then salary * 1.20
		when department = 'finance' then salary * 1.15
		when department = 'shipping' then salary * 1.10
		when department = 'marketing' then salary * 1.25
		when department = 'HR' then salary * 1.20
		when department = 'IT' then salary * 1.35
	end as new_salary;


-- 2.Создать поле new_salary типа numeric(7, 2)

alter table employees
add column new_salary numeric(7, 2);


-- 3.Заполнить поле: повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%.
 use employees;
 
select new_salary,
	case
	    when department = 'sales' then salary * 1.20
		when department = 'finance' then salary * 1.15
		when department = 'shipping' then salary * 1.10
		when department = 'marketing' then salary * 1.25
		when department = 'HR' then salary * 1.20
		when department = 'IT' then salary * 1.35
    end;
    
-- 4.Вывести из таблицы employees firstname как username, lastname как surname и новое поле fullname, которое состоит из имен и фамилий сотрудников.

alter table employees
add column full_name varchar(128);

select first_name as username, last_name as surname, concat(first_name, ' ', last_name) as full_name
from employees;

select *from employees;


-- 5.Вывести новое поле commission, которое будет null, если зарплата сотрудника меньше 3000, будет 10, если зарплата меньше 6000, будет 15, если зарплата меньше 9000, и будет 20, если зарплата больше/равно 9000.

select salary,
  case
        when salary < 3000 then 'null'
        when salary < 6000 THEN 10
        when salary < 9000 THEN 15
        when salary >= 9000 then 20
end as commission


-- 6.Создать новое поле commission и соответственно заполнить.

alter table employees
add column commission numeric;

update employees
set commission = 
	case 
		 when salary < 3000 then 'null'
         when salary < 6000 THEN 10
         when salary < 9000 THEN 15
         when salary >= 9000 then 20
	end;
  
  
-- 7.Создать поле finalsalary и заполнить формулой salary + salary * commission/10. Проверить commission на null, так чтобы в случае неопределенности finalprice принимал значение salary. 

alter table employees
add column finalsalary numeric;

update employees
set finalsalary = 
	case
		when commission is null then salary
        else salary + salary * commission/10
	end;



-- 8.Вывести поле email в нижнем регистре.

select lower(email)
 from employees;

-- 9. Создать новое поле chk_email типа varchar(128).

alter table employees
add column chk_email varchar(128);

-- 10.Заполнить поле chkemail. Если длина email меньше 3, значением chkemail будет 'Введите больше символов', если длина email больше/равно 3 и меньше 7,  
-- значением chkemail будет 'Кол/во символов совпадает', если длина email больше/равно 7,  значением chkemail будет 'Введите меньше символов'.

update employees
set chkemail = 
	case 
		 when lenght(email) < 3 then 'Введите больше символов'
		 when lenght(email) >= 3 and lenght(email) < 7 then 'Кол/во символов совпадает'
		 when lenght(email) >= 7 then 'Введите меньше символов'
	end;

  
  


    
    
    
    
    
    
    
    
    
    
    