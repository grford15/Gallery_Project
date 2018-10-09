require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'd1t95nio4ntk9g', host: 'ec2-54-221-225-11.compute-1.amazonaws.com',
      port: '5432', user: 'foxlyifcjvpzdj', password: 'a148a9c27b5d94812b63e589945841fd2b9c184a2485401a72c68ce847d4c548'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
