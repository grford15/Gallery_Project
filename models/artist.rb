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

end
