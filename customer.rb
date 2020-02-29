class Customer

  attr_reader :customer_name, :cust_fav_song, :cust_funds_available

  def initialize(customer_name, cust_fav_song, cust_funds_available)
    @customer_name = customer_name
    @cust_fav_song = cust_fav_song
    @cust_funds_available = cust_funds_available
  end

  def customer_cheers
    puts "Woohoo!"
    return "Woohoo!"
  end

  def cust_spends_cash(amount)
    @cust_funds_available -= amount
  end
end
