class Carriage
  attr_reader :type
 
end

class PassengerCarriage < Carriage
  
  def initialize(type)
    @type = "passenger"
  end

end

class CargoCarriage < Carriage

  def initialize(type)
    @type = "cargo"
  end

end


