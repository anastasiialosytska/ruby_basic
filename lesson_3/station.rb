# frozen_string_literal: true

class Station
  extend Accessors
  extend Validation
  include InstanceCounter
  attr_reader :name

  @@stations = []
  STATION_NAME = /^[А-Я][а-я]{2,19}$/.freeze

  validate :name, presence: true, type: String, format: STATION_NAME

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
  end

  def take_train(train)
    @trains << train
  end

  def show_trains
    @trains.each { |train| puts train.number }
  end

  def show_cargo_trains
    cargo_trains = []
    @trains.each do |train|
      cargo_trains << train if train.type == 'cargo'
      puts train.number if train.type == 'cargo'
    end
    puts "На станции #{name} грузовых поездов: #{cargo_trains.count}"
  end

  def show_passenger_trains
    passenger_trains = []
    @trains.each do |train|
      passenger_trains << train if train.type == 'passenger'
      puts train.number if train.type == 'passenger'
    end
    puts "На станции #{name} пассажирских поездов: #{passenger_trains.count}"
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_on_station(&block)
    @trains.each(&block)
  end
end
