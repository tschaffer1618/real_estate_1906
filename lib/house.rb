class House
  attr_reader :price, :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    categorized_rooms = @rooms.find_all { |room| category == room.category }
  end

  def total_area
    room_areas = @rooms.map { |room| room.area }
    room_areas.sum
  end

  def price_per_square_foot
    @price.delete("$").to_f / total_area
  end

  def rooms_sorted_by_area
    @rooms.sort { |a, b| b.area <=> a.area }
  end

  def rooms_sorted_by_category
    sorted_rooms = {}
    room_categories = @rooms.map { |room| room.category }
    room_categories.uniq!
    room_categories.each { |category| sorted_rooms[category] = rooms_from_category(category) }
    sorted_rooms
  end
end
