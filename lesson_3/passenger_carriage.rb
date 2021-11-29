class PassengerCarriage < Carriage
  attr_reader :occupied_places, :place_quantity, :type, :number, :free_places

  def initialize (place_quantity, type, number)
    @place_quantity = place_quantity
    @occupied_places = 0
    @free_places = place_quantity
    @type = type
    @number = number
  end

  def take_place
    @free_places -= 1
    @occupied_places += 1
  end
end
