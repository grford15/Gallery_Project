require_relative('../models/artist')
require_relative('../models/exhibit')
require('pry-byebug')

Exhibit.delete_all
Artist.delete_all


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
  'medium' => 'Oil',
  'artist_id' => artist1.id
  })

exhibit1.save()

exhibit2 = Exhibit.new ({
  'title' => 'The Starry Night',
  'year_created' => 1889,
  'medium' => 'Oil',
  'artist_id' => artist2.id
  })

  exhibit2.save()

exhibit3 = Exhibit.new ({
  'title' => 'Girl before a mirror',
  'year_created' => 1932,
  'medium' => 'Oil',
  'artist_id' => artist1.id
  })

  exhibit3.save()

exhibit4 = Exhibit.new ({
  'title' => 'Wheatfield with Crows',
  'year_created' => 1890,
  'medium' => 'Oil',
  'artist_id' => artist2.id
  })

  exhibit4.save()


binding.pry
nil
