require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')
require_relative('../room')
require_relative('../song')

class TestRoom < Minitest::Test

  def setup
    @cust1 = Customer.new("Bill", "Poison", 50)
    @cust2 = Customer.new("Jack", "Livin on a Prayer", 60)
    @cust3 = Customer.new("Sarah", "Highway to Hell", 80)

    @song1 = Song.new("Livin on a Prayer")

    @drink1 = Drink.new("Mojito", 5)
    @drink2 = Drink.new("Long Island Ice Tea", 6)
    @drink3 = Drink.new("Beer", 3)
    @drink4 = Drink.new("Malbec", 4)
    @drink5 = Drink.new("Mineral water", 1)

    @room1 = Room.new("Duo", 2, 10)
    @room2 = Room.new("Hedonism", 10, 12)
    @room3 = Room.new("Party Town", 8, 14)
  end

  def test_room_name
    assert_equal("Duo", @room1.room_name)
  end

  def test_room_capacity
    assert_equal(10, @room2.room_capacity)
  end

  def test_room_entry_fee
    assert_equal(14, @room3.room_entry_fee)
  end

end
