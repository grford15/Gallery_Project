require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry-byebug')

artist1 = Artist.new ({
  'name' => 'Pablo Picasso',
  'nationality' => 'Spanish',
  'craft' => 'Painter'
  })

artist1.save()

artist2 = Artist.new ({
  'name' => 'Vincent Van Gogh',
  'nationality' => 'Dutch',
  'craft' => 'Painter'
  })

  artist2.save()

exhibit1 = Exhibit.new ({
  'title' => 'La Vie',
  'year_created' => 1903,
  'medium' => 'Oil-on-Canvas',
  'artist_id' => artist1.id
  })

exhibit1.save()

exhibit2 = Exhibit.new ({
  'title' => 'The Starry Night',
  'year_created' => 1889,
  'medium' => 'Oil-on-Canvas',
  'artist_id' => artist2.id
  })

  exhibit2.save()


binding.pry
nil
