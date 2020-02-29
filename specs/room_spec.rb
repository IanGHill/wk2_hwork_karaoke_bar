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

  def test_get_room_head_count
    @room1.check_guest_in(@cust1)
    assert_equal(1, @room1.get_room_head_count)
  end

  def test_get_num_of_songs_available
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2,@room1.get_num_of_songs_available)
  end

  def test_add_song
    @room2.add_song(@song1)
    @room2.add_song(@song2)
    @room2.add_song(@song3)
    assert_equal(3,@room2.get_num_of_songs_available)
  end

  def test_cust_checks_song_list__fav_found
    @room2.add_song(@song1)
    @room2.add_song(@song2)
    @room2.add_song(@song3)
    assert_equal("Woohoo!", @room2.cust_checks_song_list(@cust1))
  end

  def test_cust_checks_song_list__fav_not_found
    @room2.add_song(@song1)
    @room2.add_song(@song1)
    @room2.add_song(@song1)
    assert_equal("Customer grumbles", @room2.cust_checks_song_list(@cust1))
  end

  def test_collect_entry_fee
    @room1.collect_entry_fee(@cust1)
    assert_equal(40, @cust1.cust_funds_available)
  end

  def test_check_guest_in_under_capacity
    @room1.check_guest_in(@cust1)
    assert_equal(1, @room1.get_room_head_count)
  end

  def test_check_guest_in_reach_capacity
    @room1.check_guest_in(@cust1)
    @room1.check_guest_in(@cust2)
    assert_equal(2, @room1.get_room_head_count)
  end

  def test_check_guest_in_over_capacity
    @room1.check_guest_in(@cust1)
    @room1.check_guest_in(@cust2)
    @room1.check_guest_in(@cust3)
    assert_equal(2, @room1.get_room_head_count)
  end

  def test_check_guest_out
    @room1.check_guest_in(@cust1)
    @room1.check_guest_in(@cust2)
    @room1.check_guest_out(@cust1)
    assert_equal(1, @room1.get_room_head_count)
  end

  def test_check_guest_in_cust_has_enough_money
    @room1.check_guest_in(@cust1)
    assert_equal(10, @room1.room_total_entry_fees)
    assert_equal(40, @cust1.cust_funds_available)
  end

  def test_collect_entry_fee_cust_insufficient_funds
    @room1.check_guest_in(@cust4)
    assert_equal(0, @room1.room_total_entry_fees)
    assert_equal(0, @cust4.cust_funds_available)
  end

  def test_sell_drink_to_customer_enough_money
    
  end


end
