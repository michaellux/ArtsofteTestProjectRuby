create or replace procedure delete_employee_place(
  Id uuid
)
language plpgsql    
as $$
begin
		DELETE FROM employee_places
		where uuid=(SELECT uuid FROM employee_places WHERE uuid=Id);

    commit;
end;$$
