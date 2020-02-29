class Room

  attr_reader :room_name, :room_capacity, :room_entry_fee

  def initialize(room_name, room_capacity, room_entry_fee)
    @room_name = room_name
    @room_capacity = room_capacity
    @room_entry_fee = room_entry_fee
    @room_drink_selection = []
    @room_song_selection = []
    @room_total_bar_takings = 0
    @room_total_entry_fees = 0
  end

end
