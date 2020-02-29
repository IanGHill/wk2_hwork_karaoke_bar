class Room

  attr_reader :room_name, :room_capacity, :room_entry_fee, :room_total_bar_takings, :room_total_entry_fees

  def initialize(room_name, room_capacity, room_entry_fee)
    @room_name = room_name
    @room_capacity = room_capacity
    @room_entry_fee = room_entry_fee
    @room_drink_selection = []
    @room_song_selection = []
    @room_guest_list = []
    @room_total_bar_takings = 0
    @room_total_entry_fees = 0
  end

  def get_room_head_count
    return @room_guest_list.length
  end

  def get_num_of_songs_available
    return @room_song_selection.length
  end

  def add_song(song)
    @room_song_selection << song
  end

  def cust_checks_song_list(customer)

    song_found = false

    @room_song_selection.each do |song|

      if song.song_name == customer.cust_fav_song
        song_found = true
      end
    end

    if song_found
      customer.customer_cheers
    else
      puts "Customer grumbles"
      return "Customer grumbles"
    end
  end

  def collect_entry_fee(customer)
    customer.cust_spends_cash(@room_entry_fee)
    @room_total_entry_fees += @room_entry_fee
  end

  def check_guest_in(customer)
    if get_room_head_count < @room_capacity
      if customer.cust_funds_available >= @room_entry_fee
        collect_entry_fee(customer)
        @room_guest_list << customer
      else
        puts "Entry denied - insufficient funds!"
      end
    else
      puts "Room already full!"
    end
  end

  def check_guest_out(customer)
    @room_guest_list.delete(customer)
  end


end
