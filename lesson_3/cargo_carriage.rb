class CargoCarriage < Carriage
  def initialize(total_place, type, number)
    super
  end

  def take_place(volume)
    @used_place += volume
  end
end
