require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestDrink < Minitest::Test

  def setup
    @drink1 = Drink.new("Mojito", 5)
    @drink2 = Drink.new("Long Island Ice Tea", 6)
    @drink3 = Drink.new("Beer", 3)
    @drink4 = Drink.new("Malbec", 4)
    @drink5 = Drink.new("Mineral water", 1)
  end

  def test_drink_name
    assert_equal("Long Island Ice Tea", @drink2.drink_name)
  end

  def test_drink_price
    assert_equal(1, @drink5.drink_price)
  end
end
