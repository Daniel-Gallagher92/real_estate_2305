require './lib/room'
require './lib/house'

RSpec.describe House do 
  it "exists w/ attributes" do 
    house = House.new("$400000", "123 sugar lane")

    expect(house).to be_a(House)
    expect(house.price).to eq(400000)
    expect(house.address).to eq("123 sugar lane")
    expect(house.rooms).to eq []
  end

  it "can add rooms" do 
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house.add_room(room_1)
    house.add_room(room_2)

    expect(house.rooms).to eq([room_1, room_2])
  end

  it "compares to market average" do 
    house = House.new("$400000", "123 sugar lane")

    expect(house.above_market_average?).to eq(false)
  end

  it "returns room by category" do 
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.rooms_from_category(:bedroom)).to eq([room_1, room_2])
    expect(house.rooms_from_category(:basement)).to eq([room_4])
  end

  it "can check area after expansions added" do 
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')
    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    expect(house.area).to eq(1900)
  end
end