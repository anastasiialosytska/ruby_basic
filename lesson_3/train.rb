# frozen_string_literal: true

class Train
  extend Validation
  extend Accessors
  include ManufacturerName
  include InstanceCounter
  attr_reader :number, :type
  attr_accessor :carriages, :speed, :current_station

  TRAIN_NUMBER = /^[\dа-я]{3}-?[\dа-я]{2}$/i.freeze
  @@trains = []

  validate :number, presence: true, type: String, format: TRAIN_NUMBER

  def self.find(train_number)
    @@trains.find { |train| train.number == train_number }
  end

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @current_station = nil
    @carriages = []
    @manufacturer_name = nil
    @@trains << self
    register_instance
    validate!
  end

  def current_speed
    puts "Текущая скорость: #{speed} км/ч"
  end

  def check_carriage_quantity
    @carriages.count
  end

  def add_carriage(carriage)
    @carriages << carriage if type == carriage.type && speed.zero?
  end

  def delete_carriage
    @carriages.pop if speed.zero?
  end

  def follow_route(route)
    route.stations[0].take_train(self)
    @current_station = route.stations[0]
  end

  def move_next_station(route)
    @current_station.send_train(self)
    @current_station = route.stations[current_index(route) + 1]
    @current_station.take_train(self)
  end

  def move_previous_station(route)
    @current_station.send_train(self)
    @current_station = route.stations[current_index(route) - 1]
    @current_station.take_train(self)
  end

  def show_stations_around(route)
    puts "Текущая станция: #{current_station.name}"
    puts "Предыдущая станция: #{route.stations[current_index(route) - 1].name}"
    puts "Следующая станция: #{route.stations[current_index(route) + 1].name}"
  end

  def all_carriages(&block)
    @carriages.each(&block)
  end

  protected

  def go(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def current_index(route)
    route.stations.index(@current_station)
  end
end
