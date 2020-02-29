require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')

class TestCustomer < Minitest::Test

  def setup
    @cust1 = Customer.new("Bill", "Poison", 50)
    @cust2 = Customer.new("Jack", "Livin on a Prayer", 60)
    @cust3 = Customer.new("Sarah", "Highway to Hell", 80)
  end

  def test_customer_name
    assert_equal("Bill", @cust1.customer_name)
  end

  def test_cust_fav_song
    assert_equal("Livin on a Prayer", @cust2.cust_fav_song)
  end

  def test_cust_funds_available
    assert_equal(80, @cust3.cust_funds_available)
  end

  def test_cust_cheer
    assert_equal("Woohoo!", @cust1.customer_cheers)
  end

  def test_cust_spends_cash
    @cust3.cust_spends_cash(5)
    assert_equal(75, @cust3.cust_funds_available)
  end
end
