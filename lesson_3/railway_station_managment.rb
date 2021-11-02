class Station
  attr_reader :name

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

  def show_freight_trains
    freight_trains = []
    @trains.each do |train|
      freight_trains << train if train.type == "freight"
      puts train.number if train.type == "freight"
    end
    puts "На станции #{self.name} грузовых поездов: #{freight_trains.count}"
  end

  def show_passenger_trains
    passenger_trains = []
    @trains.each do |train|
      passenger_trains << train if train.type == "passenger"
      puts train.number if train.type == "passenger"
    end
    puts "На станции #{self.name} пассажирских поездов: #{passenger_trains.count}"
  end

  def send_train(train)
    @trains.delete(train)
  end

end

class Route
  attr_reader :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = []
  end

  def final_route
    @final_route = []
    @final_route << first_station << @stations << last_station
    @final_route.flatten!
  end

  def add_station(station)
    @stations << station
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def show_stations
    @final_route.each { |station| puts station.name }
  end

end

class Train

  attr_reader :number, :type
  attr_accessor :carriage_quantity, :speed, :current_station

  def initialize(number, type, carriage_quantity)
    @number = number
    @type = type
    @carriage_quantity = carriage_quantity
    @speed = 0
    @current_station = nil
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

  def add_carriage
    self.carriage_quantity += 1 if self.speed == 0
  end

  def delete_carriage
    self.carriage_quantity -= 1 if self.speed == 0
  end

  def follow_route(route)
    route.final_route[0].take_train(self)
    @current_station = route.final_route[0]
  end

  def move_next_station
    route.final_route.each { |i| @final_route[i+1].take_train(self) }
  end

  def move_previous_station

  end

  def show_sations_around
    puts "Текущая станция: #{self.current_station}"
    puts "Предыдущая станция: "
    puts "Следующая станция: "
  end

 end

