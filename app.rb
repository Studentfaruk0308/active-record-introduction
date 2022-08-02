require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/students.sqlite"
  )

  sql = <<-SQL
  CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY,
  name TEXT
  )
SQL

# Remember, the previous step has to run first so that `connection` is set!
ActiveRecord::Base.connection.execute(sql)

class Student < ActiveRecord::Base

end

# puts Student.column_names

Student.create(name: 'Andre')

student = Student.find_by(name: 'John')
student.name = 'Bidre'
student.save


# puts Student.find(1).name

# puts Student.find_by(name: 'John').name
