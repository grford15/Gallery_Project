require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry-byebug')

artist1 = Artist.new ({
  'name' => 'Pablo Picasso',
  'nationality' => 'Spanish',
  'craft' => 'Painter'
  })

artist1.save()

exhibit1 = Exhibit.new ({
  'title' => 'La Vie',
  'year_created' => 1903,
  'medium' => 'Oil-on-Canvas',
  'artist_id' => 1
  })

exhibit1.save()




binding.pry
nil
