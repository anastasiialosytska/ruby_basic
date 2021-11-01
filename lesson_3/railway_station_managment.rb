class Station

  def initialize(name)
    @name = name
    @trains = []
  end

  def take_train(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train.number }
  end

  def send_train(train)
    @trains.delete(train)
  end

end

class Route

  def initialize
    @first_station = first_station
    @last_station = last_station
  end

end

class Train

  attr_reader :number

  def initialize(number, type, carriage_quantity)
    @number = number
    @type = type
    @carriage_quantity = carriage_quantity
  end

 end


# @trains.each { |train| puts train.number }