require_relative('../db/sql_runner')

class Exhibit

  attr_reader :id
  attr_accessor :title, :year_created, :medium, :artist_id

  def initialize(options)

    @id = options['id'].to_i if options['id']
    @title = options['title']
    @year_created = options['year_created']
    @medium = options['medium']
    @artist_id = options['artist_id'].to_i

  end

end
