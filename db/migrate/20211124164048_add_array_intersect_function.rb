class AddArrayIntersectFunction < ActiveRecord::Migration[6.0]
   def up
    execute(<<-SQL)
    create or replace function array_intersect(anyarray, anyarray)
    returns anyarray language sql
    as $$
      select
        case
          when $1 is null then $2
          when $2 is null then $1
          else
            array(
              select unnest($1)
              intersect
              select unnest($2)
            )
        end;
    $$;
    SQL
  end

  def down
    execute(<<-SQL)
    DROP FUNCTION array_intersect
    SQL
  end
end
