require('minitest/autorun')
require('minitest/rg')
require_relative('../models/artist')
require_relative('../models/exhibit')

class TestArtist < MiniTest::Test

  def setup
    @artist1 = Artist.new ({
      'name' => 'Pablo Picasso',
      'nationality' => 'Spanish',
      'craft' => 'Painter'
      })
  end

  def test_artist_name
    assert_equal('Pablo Picasso', @artist1.name)
  end

  def test_artist_nationality
    assert_equal('Spanish', @artist1.nationality)
  end

  def test_artist_craft
    assert_equal('Painter', @artist1.craft)
  end

end

class TestExhibit < MiniTest::Test

  def setup
    @exhibit1 = Exhibit.new ({
      'title' => 'La Vie',
      'year_created' => 1903,
      'medium' => 'Oil-on-Canvas',
      'artist_id' => 1
      })
  end

  def test_exhibit_title
    assert_equal('La Vie', @exhibit1.title)
  end

  def test_exhibit_year_created
    assert_equal(1903, @exhibit1.year_created)
  end

  def test_exhibit_medium
    assert_equal('Oil-on-Canvas', @exhibit1.medium)
  end

  def test_exhibit_artist_id
    assert_equal(1, @exhibit1.artist_id)
  end


end
