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

   

end
