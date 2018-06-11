require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/exhibit')
also_reload('models/*')

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

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:"artists/show")
end

post '/artists/delete/:id' do
  @artist = Artist.find(params['id'])
  @artist.delete
  redirect '/artists'
end
