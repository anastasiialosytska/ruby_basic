# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'valid'
require_relative 'manufacturer_name'
require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'menu_methods'
require_relative 'user_menu'

class Main
  include MenuMethods
  include UserMenu

  attr_accessor :stations, :trains, :routs

  def initialize
    @stations = {}
    @trains = {}
    @routs = {}
  end

  Main.new.call
end
