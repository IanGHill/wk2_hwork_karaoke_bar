class Venue

  attr_reader :venue_name, :venue_rooms

  def initialize(venue_name)
    @venue_name = venue_name
    @venue_rooms = []
    @total_bar_takings = 0
    @total_entry_fees = 0
    @total_takings = 0
  end

  def add_rooms(room)
    @venue_rooms << room
  end

  def get_total_bar_takings
    @venue_rooms.each {|room| @total_bar_takings += room.room_total_bar_takings}
    return @total_bar_takings
  end

  def get_total_entry_fees
    @venue_rooms.each {|room| @total_entry_fees += room.room_total_entry_fees}
    return @total_entry_fees
  end

  def get_total_takings
    get_total_bar_takings
    get_total_entry_fees
    @total_takings = @total_entry_fees + @total_bar_takings
    return @total_takings
  end

end
