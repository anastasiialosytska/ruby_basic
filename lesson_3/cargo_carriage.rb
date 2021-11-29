class CargoCarriage < Carriage
  attr_reader :general_value, :occupied_value, :type, :number

  def initialize(general_value, type, number)
    @general_value = general_value
    @free_value = general_value
    @occupied_value = 0
    @type = type
    @number = number
  end

  def take_value(value)
    @free_value -= value
    @occupied_value += value
  end
end
