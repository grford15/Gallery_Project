require_relative('../db/sql_runner')

class Artist

  attr_accessor :name, :nationality, :craft
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @nationality = options['nationality']
    @craft = options['craft']
  end

  def save()
    sql = "INSERT INTO artists (name, nationality, craft)
     VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @nationality, @craft]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM artists"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql= "DELETE * FROM artists"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql "SELECT FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Artist.new(result)
  end

end
