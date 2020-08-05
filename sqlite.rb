require "sqlite3"

db = SQLite3::Database.new "rb_sqlite.db"

clear_table =  "DROP TABLE IF EXISTS language;"

ctb_lang = <<-SQL 
        CREATE TABLE language (
        id int AUTO_INCREMENT,
        name VARCHAR(10),
        type VARCHAR(10),
        author VARCHAR(20),
        PRIMARY KEY(id)
    );    
SQL

inst_lang = <<-SQL 
    INSERT INTO language
    (name, type, author)
    VALUES 
    ("Ruby", "dynamic", "Yukihiro Matsumoto"),
    ("PHP", "dynamic", "Rasmus Lerdorf"),
    ("Python", "dynamic", "Guido Van Rossum"),
    ("Go", "static", "Robert Griesemer"),
    ("Elixir", "static", "José Valim");
SQL

db.execute(clear_table)
db.execute(ctb_lang)
db.execute(inst_lang)

results = db.execute("select * from language")

results.each do |result|
    puts result
end