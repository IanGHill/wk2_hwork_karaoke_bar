require('minitest/autorun')
require('minitest/reporters')
require('pry-byebug')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../room')
require_relative('../song')
require_relative('../venue')

class TestVenue < Minitest::Test

  def setup

    @venue1 = Venue.new("Best lil karaoke bar in town")
    @cust1 = Customer.new("Bill", "Poison", 50)
    @cust2 = Customer.new("Jack", "Livin on a Prayer", 60)
    @cust3 = Customer.new("Sarah", "Highway to Hell", 80)
    @cust4 = Customer.new("Broke", "Aint Gotta Dime", 0)

    @song1 = Song.new("Livin on a Prayer")
    @song2 = Song.new("Poison")
    @song3 = Song.new("Highway to Hell")

    @drink1 = Drink.new("Mojito", 5)
    @drink2 = Drink.new("Long Island Ice Tea", 6)
    @drink3 = Drink.new("Beer", 3)
    @drink4 = Drink.new("Malbec", 4)
    @drink5 = Drink.new("Mineral water", 1)

    @room1 = Room.new("Duo", 2, 10)
    @room2 = Room.new("Hedonism", 10, 12)
    @room3 = Room.new("Party Town", 8, 14)

    @venue1.add_rooms(@room1)
    @venue1.add_rooms(@room2)
    @venue1.add_rooms(@room3)

    @room1.add_song(@song1)
    @room2.add_song(@song2)
    @room3.add_song(@song3)

    @room1.add_drink(@drink1)
    @room1.add_drink(@drink2)
    @room1.add_drink(@drink3)

    @room2.add_drink(@drink1)
    @room2.add_drink(@drink2)
    @room2.add_drink(@drink3)

    @room3.add_drink(@drink1)
    @room3.add_drink(@drink2)
    @room3.add_drink(@drink3)

    @room1.check_guest_in(@cust1)
    @room2.check_guest_in(@cust2)
    @room3.check_guest_in(@cust3)
    @room1.sell_drink_to_customer(@cust1, @drink1)
    @room1.sell_drink_to_customer(@cust1, @drink1)
    @room2.sell_drink_to_customer(@cust2, @drink2)
    @room2.sell_drink_to_customer(@cust2, @drink2)
    @room3.sell_drink_to_customer(@cust3, @drink3)
    @room3.sell_drink_to_customer(@cust3, @drink3)


  end

  def test_get_venue_name
    assert_equal("Best lil karaoke bar in town", @venue1.venue_name)
  end

  def test_add_room
    assert_equal(3, @venue1.venue_rooms.length)
  end

  def test_get_total_bar_takings
    # binding.pry
    assert_equal(28, @venue1.get_total_bar_takings)
  end

  def test_get_total_entry_fees
    assert_equal(36, @venue1.get_total_entry_fees)
  end

  def test_get_total_takings
    assert_equal(64, @venue1.get_total_takings)
  end

end
