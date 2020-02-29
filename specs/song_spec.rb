require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song1 = Song.new("Livin on a Prayer")
  end

  def test_song_name
    assert_equal("Livin on a Prayer", @song1.song_name)
  end
end
