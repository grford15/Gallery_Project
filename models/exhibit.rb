require_relative('../db/sql_runner')

class Exhibit

  attr_reader :id
  attr_accessor :title, :year_created, :medium, :artist_id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year_created = options['year_created'].to_i
    @medium = options['medium']
    @artist_id = options['artist_id'].to_i

  end

  def save()
    sql = "INSERT INTO exhibits (title, year_created, medium, artist_id)
    VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@title, @year_created, @medium, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def delete()
    sql = "DELETE FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM exhibits"
    SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE * FROM exhibits"
    SqlRunner.run(sql)
  end

end
