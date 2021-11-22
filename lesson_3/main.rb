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

class Menu
  attr_accessor :stations, :trains, :routs, :input

  def initialize
    @stations = {}
    @trains = {}
    @routs = {}
    @input = nil
  end

  def call
    loop do
    puts "1. Создать станцию"
    puts "2. Создать поезд"
    puts "3. Создать маршрут"
    puts "4. Добавить станцию на маршрут"
    puts "5. Удалить станцию с маршрута"
    puts "6. Назначить маршрут поезду"
    puts "7. Добавить вагон к поезду"
    puts "8. Отцепить вагон от поезда"
    puts "9. Переместить поезд на следующую станцию"
    puts "10. Переместить поезд на предыдущую станцию"
    puts "11. Посмотреть список станций на маршруте"
    puts "12. Посмотреть список поездов на станции"
    puts "0. Выход"
    print "Выберите вариант: "
    self.input = gets.to_i
    break if input == 0
    
    case input
    when 1
      print "Введите название станции: "
      @station_name = gets.chomp
      create_station
    when 2
      
        puts "Выберите тип поезда:"
        puts "1. Пассажирский"
        puts "2. Грузовой"
        @train_type = gets.to_i
      begin
        print "Введите номер поезда: "
        @train_number = gets.chomp
        create_train
      rescue
        puts "Некорректный номер поезда. Укажите номер в формате ХХХ-ХХ"
        retry
      end
    when 3
      print "Введите начальную станцию: "
      @first_station = gets.chomp
      print "Введите конечную станцию: "
      @last_station = gets.chomp
      create_route
    when 4
      print "Введите название маршрута: "
      @route = gets.chomp
      print "Введите название станции, которую хотите добавить в маршрут: "
      @new_station = gets.chomp
      add_station
    when 5
      print "Введите название маршрута: "
      @route = gets.chomp
      print "Введите название станции, которую хотите удалить из маршрута: "
      @removal_station = gets.chomp
      delete_station
    when 6
      print "Введите номер поезда, которому необходимо назначить маршрут: "
      @train_number = gets.chomp
      print "Введите название маршрута: "
      @route = gets.chomp
      follow_route
    when 7
      print "Введите номер поезда, к которому необходимо прицепить вагон: "
      @train_number = gets.chomp
      add_carriage
    when 8
      print "Введите номер поезда, от которого необходимо отцепить вагон: "
      @train_number = gets.chomp
      delete_carriage
    when 9
      print "Введите номер поезда: "
      @train_number = gets.chomp
      print "Введите название маршрута: "
      @route = gets.chomp
      move_next_station
    when 10
      print "Введите номер поезда: "
      @train_number = gets.chomp
      print "Введите название маршрута: "
      @route = gets.chomp
      move_previous_station
    when 11
      print "Введите название маршрута: "
      @route = gets.chomp
      show_stations
    when 12
      print "Введите название станции: "
      @station_name = gets.chomp
      show_trains
    end
    end
  end

  private
  #все методы ниже нужны только для отработки метода call, поэтому могут быть помещены в секцию private

  def create_station
    stations[@station_name] = Station.new(@station_name)
    puts "Создана станция #{@station_name}"
  end

  def create_train
    if @train_type == 1
      trains[@train_number] = PassengerTrain.new(@train_number, "passenger")
      puts "Создан пассажирский поезд с номером #{@train_number}"
    elsif @train_type == 2
      trains[@train_number] = CargoTrain.new(@train_number, "cargo")
      puts "Создан грузовой поезд с номером #{@train_number}"
    end

  end

  def create_route
    begin_of_route = @stations[@first_station]
    end_of_route = @stations[@last_station]
    if @stations.keys.include?(@first_station) && @stations.keys.include?(@last_station)
      routs["#{@first_station} - #{@last_station}"] = Route.new(begin_of_route, end_of_route)
      puts "Создан маршрут #{@first_station} - #{@last_station}"
    else
      puts "Указанных станций не существует. Сначала создайте станции"
    end
  end

  def add_station
    if @routs.keys.include?(@route) && @stations.keys.include?(@new_station)
      @routs[@route].add_station(@stations[@new_station])
    else
      puts "Несуществующий маршрут или станция"
    end
  end

  def delete_station
    if @routs.keys.include?(@route) && @stations.keys.include?(@removal_station)
      @routs[@route].delete_station(@stations[@removal_station])
      puts "Станция #{@removal_station} удалена из маршрута"
    elsif
      puts "Несуществующий маршрут или станция"
    end   
  end

  def follow_route
    if @routs.keys.include?(@route) && @trains.keys.include?(@train_number)
      @trains[@train_number].follow_route(@routs[@route])
      puts "Поезд #{@train_number} следует по маршруту #{@route}"
    elsif
      puts "Несуществующий маршрут или поезд"
    end  
  end

  def add_carriage
    if @trains[@train_number].class == PassengerTrain && @trains.keys.include?(@train_number)
      @trains[@train_number].add_carriage(PassengerCarriage.new("passenger"))
      puts "К поезду #{@train_number} прицеплен пассажирский вагон"
    elsif @trains[@train_number].class == CargoTrain && @trains.keys.include?(@train_number)
      @trains[@train_number].add_carriage(CargoCarriage.new("cargo"))
      puts "К поезду #{@train_number} прицеплен грузовой вагон"
    else
      puts "Поезд с таким номером не существует. Сначала создайте поезд"
    end
  end

  def delete_carriage
    train = @trains[@train_number]
    if train.carriages.empty?
      puts "К поезду #{@train_number} ещё не прицеплен ни один вагон"
    else
      train.delete_carriage
      puts "От поезда #{@train_number} отцеплен вагон"
    end
  end

  def move_next_station
    train = @trains[@train_number]
    if train.current_station != nil
      train.move_next_station(@routs[@route])
    else
      puts "Поезду #{@train_number} еще не назначен маршрут"
    end
  end

  def move_previous_station
    train = @trains[@train_number]
    if train.current_station != nil
      train.move_previous_station(@routs[@route])
    else
      puts "Поезду #{@train_number} еще не назначен маршрут"
    end
  end

  def show_stations
    route = @routs[@route]
    if @routs.keys.include?(@route)
      route.show_stations
    else
      print "Указанный маршрут не существует"
    end
  end

  def show_trains
    station = @stations[@station_name]
    if @stations.keys.include?(@station_name)
      station.show_trains
    else
      print "Указанная станция не существует"
    end
  end
end

menu = Menu.new.call