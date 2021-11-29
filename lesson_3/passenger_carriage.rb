class PassengerCarriage < Carriage
  def initialize(total_place, type, number)
    super
  end

  def take_place
    @used_place += 1
  end
end
