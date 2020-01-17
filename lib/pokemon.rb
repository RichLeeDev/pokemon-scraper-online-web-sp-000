class Pokemon
  
 attr_accessor :id, :name, :type, :db
 
def initialize(id:, name:, type:, db: )
  @id = id
  @name = name
  @type = type
  @db = db
end

# def self.new_from_db(row)
#   new_pokemon = Self.new
#   new_pokemon.id = row[0]
#   new_pokemon.name = row[1]
#   new_pokemon.type = row[2]
#   new_pokemon
# end 

def self.save
  sql = <<-SQL
  INSERT INTO pokemon (name, type)
  VALUES (?, ?)
  SQL
  
  db.execute(sql, self.name, self.type)
  @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

# # def self.find
# #   sql = <<-SQL
# SELECT * 
# FROM pokemons
# WHERE name = ?
# LIMIT 1
# SQL

# db.execute(sql, self.name).map do |row|
#   self.new_from_db(row)
  
# end 

end

