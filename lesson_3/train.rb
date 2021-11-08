class Train

  attr_reader :number, :type
  attr_accessor :carriages, :speed, :current_station, :current_index

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @current_station = nil
    @carriages = []
  end

  def go(speed)
    self.speed = speed
  end

  def current_speed
    puts "Текущая скорость: #{self.speed} км/ч"
  end

  def stop
    self.speed = 0
  end

  def check_carriage_quantity
    puts "Количество вагонов: #{self.carriage_quantity}"
  end

  def add_carriage(carriage)
    @carriages << carriage if self.type == carriage.type && self.speed == 0
  end

  def delete_carriage
    @carriages.pop if self.speed == 0
  end

  def follow_route(route)
    route.stations[0].take_train(self)
    @current_station = route.stations[0]
  end

  def current_index(route)
    route.stations.index(@current_station)
  end

  def move_next_station(route)
    @current_station.send_train(self)
    @current_station = route.stations[current_index(route) +1]
    @current_station.take_train(self)
  end

  def move_previous_station(route)
    @current_station.send_train(self)
    @current_station = route.stations[current_index(route) -1]
    @current_station.take_train(self)
  end

  def show_stations_around(route)
    puts "Текущая станция: #{self.current_station.name}"
    puts "Предыдущая станция: #{route.stations[current_index(route) -1].name}"
    puts "Следующая станция: #{route.stations[current_index(route) +1].name}"
  end

 end

 class PassengerTrain < Train

  attr_reader :type
  attr_accessor :carriages

  def initialize(number, type)
    super
    @type = "passenger"
  end

 end

 class CargoTrain < Train

  attr_reader :type
  attr_accessor :carriages

  def initialize(number, type)
    super
    @type = "cargo"
  end

 end
