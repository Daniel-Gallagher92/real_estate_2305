class House 
  attr_reader :address, :rooms
  def initialize(price, address)
    @price = price
    @address = address 
    @rooms = []
  end

  def price 
    @price.delete("$").to_i
  end

  def add_room(room) 
    @rooms << room
  end

  def above_market_average? 
    if @price.to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category) 
    @rooms.select do |room|
    room.category == category
    end
  end

    def area
     @rooms.map do |room|
      room.area
     end.sum
    end

end