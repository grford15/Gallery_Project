require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/exhibit')


get '/' do
  erb( :index )
end

get '/artists' do
  @artists = Artist.all()
  erb( :"artists/artists")
end

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb( :"exhibits/exhibits")
end
