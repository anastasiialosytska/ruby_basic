class Station

  include InstanceCounter
  attr_reader :name

  @@all_stations = []

  def self.all
    return @@all_stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
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
