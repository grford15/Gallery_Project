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

  def update()
    sql = "UPDATE exhibits SET (title, year_created, medium, artist_id)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@title, @year_created, @medium, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM exhibits"
    result = SqlRunner.run(sql)
    return result.map { |exhibit| Exhibit.new(exhibit)}
  end

  def self.delete_all()
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM exhibits WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Exhibit.new(result.first)
  end

end
