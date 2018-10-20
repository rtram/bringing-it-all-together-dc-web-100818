require 'pry'

class Dog 
  
  attr_accessor :name, :breed, :id
  
  def initialize(name:, breed:, id: nil)
    @name = name
    @breed = breed
    @id = id
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE dogs(
        id INTEGER PRIMARY KEY,
          name TEXT,
          breed TEXT
      );
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def save
    sql = <<-SQL
      INSERT INTO dogs(name, breed)
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
    
    self.id = DB[:conn].execute("SELECT last_insert_rowid() from dogs")[0][0]
    self
  end 
  
  def self.create(row)
    dog = Dog.new(row)
    dog.save
  end 
  
  def self.find_by_id(id)
    sql = <<-SQL
      SELECT *
      FROM dogs
      WHERE id = ?
    SQL
    
    row = DB[:conn].execute(sql,id)[0]
    dog = Dog.new(id: row[0], name: row[1], breed: row[2])
  end
  
  def self.find_or_create_by(name)
    sql = <<-SQL
      
    SQL
    
  end 
end 