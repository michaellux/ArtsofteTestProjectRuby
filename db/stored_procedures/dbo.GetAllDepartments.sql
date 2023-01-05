CREATE OR REPLACE FUNCTION get_all_departments ()
  RETURNS TABLE (uuid uuid, name text, floor integer,
    created_at timestamp(6), updated_at timestamp(6))
  LANGUAGE plpgsql AS
$func$
BEGIN
   RETURN QUERY
   SELECT * FROM departments;
END
$func$;







