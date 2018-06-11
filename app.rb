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

get '/newartist' do
  erb(:"artists/new")
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save()
  redirect '/artists'
end
