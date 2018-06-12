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

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'])
  erb(:"exhibits/show")
end

post '/artists/delete/:id' do
  @artist = Artist.find(params['id'])
  @artist.delete
  redirect '/artists'
end

get '/newexhibit' do
  @artists = Artist.all
  erb(:"exhibits/new")
end

post '/exhibits' do
  Exhibit.new(params).save
  redirect '/exhibits'
end

post '/exhibits/delete/:id' do
  @exhibit = Exhibit.find(params['id'])
  @exhibit.delete
  redirect '/exhibits'
end

get '/artists/edit/:id' do
  @artists = Artist.find(params['id'])
  erb(:"artists/edit")
end

post '/artists/edit/:id' do
  @artists = Artist.new(params)
  @artists.update
  redirect '/artists'
end

get '/exhibits/edit/:id' do
  @artists = Artist.all
  @exhibits = Exhibit.find(params['id'])
  erb(:"exhibits/edit")
end

post '/exhibits/edit/:id' do
  @exhibits = Exhibit.new(params)
  @exhibits.update
  redirect '/exhibits'
end
