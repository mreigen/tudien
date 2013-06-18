class MigrateTablesFromMysql < ActiveRecord::Migration
  def up
    sql = ""
    source = File.new("./db/tables.sql", "r")
    while (line = source.gets)
      sql << line
    end
    source.close
    execute sql
  end

  def down
    sql = ""
    source = File.new("./db/drop_all_tables.sql", "r")
    while (line = source.gets)
      sql << line
    end
    source.close
    execute sql
  end
end
