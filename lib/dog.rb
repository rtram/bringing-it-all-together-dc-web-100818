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
      CREATE TABLE dog(
        id INTEGER PRIMARY KEY,
          name TEXT,
          breed TEXT
      );
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def 
end 