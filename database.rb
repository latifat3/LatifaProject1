require 'sqlite3'

class DBHandler
	def initialize
	begin
	db = SQLite3::Database.open "student.db"
	dbstatement = "CREATE TABLE IF NOT EXISTS Students(ID INTEGER PRIMARY KEY, firstname TEXT,lastname TEXT, Email TEXT, Major TEXT, graduationstatus TEXT)"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

def create(firstname, lastname, email, major, graduationstatus)
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "INSERT INTO Students(firstname,lastname,Email,Major,GraduationStatus) VALUES ('#{firstname}','#{lastname}','#{email}','#{major}','#{graduationstatus}')"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

def all
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "SELECT * FROM Students"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

def get(val)
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "SELECT * FROM Students WHERE Id='#{val}'"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

def update(id, firstname, lastname, email, major, graduationstatus )
	begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "UPDATE Students SET firstname='#{firstname}', lastname='#{lastname}', Email='#{email}', Major='#{major}', GraduationStatus='#{graduationstatus}' WHERE Id='#{id}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occurred"
			puts e
		ensure
			db.close if db
		end
end

def destroy(id)
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "DELETE FROM Students WHERE Id='#{id}'"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

#table of students that have already graduated
def allGrads
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "SELECT * FROM Students WHERE graduationstatus='yes' or graduationstatus='Yes'"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end

#table of students that haven't graduated yet
def allCurrent
	begin
		db = SQLite3::Database.open "student.db"
		dbstatement = "SELECT * FROM Students WHERE graduationstatus='no' or graduationstatus='No'"
		db.execute dbstatement
	rescue SQLite3::Exception => e
		puts "Exception Occurred"
		puts e
	ensure
		db.close if db
	end
end
end

