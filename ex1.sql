select * from sales

create or replace function price_status(price double precision)
returns varchar as $$
declare price_status text;
begin
   if price <= 50 then price_status := 'cheap';
   elseif price <= 60 then price_status := 'moderate';
   else price_status := 'expensive';
   end if;
   return price_status;
end;
$$ language plpgsql


select price_status(23)   -----cheap

select price_status(51)    ----moderate

select price_status(72)    ----expensive

select * from sales

select * , price_status (price) from sales

alter table sales add column price_status varchar

select * from sales

update sales set price_status = price_status (price)

select * from sales




   