# frozen_string_literal: true

module MenuMethods
  def create_station
    stations[@station_name] = Station.new(@station_name)
    puts "Создана станция #{@station_name}"
  end

  def create_train
    case @train_type
    when 1
      trains[@train_number] = PassengerTrain.new(@train_number, 'passenger')
      puts "Создан пассажирский поезд с номером #{@train_number}"
    when 2
      trains[@train_number] = CargoTrain.new(@train_number, 'cargo')
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
      puts 'Указанных станций не существует. Сначала создайте станции'
    end
  end

  def add_station
    if @routs.keys.include?(@route) && @stations.keys.include?(@new_station)
      @routs[@route].add_station(@stations[@new_station])
    else
      puts 'Несуществующий маршрут или станция'
    end
  end

  def delete_station
    if @routs.keys.include?(@route) && @stations.keys.include?(@removal_station)
      @routs[@route].delete_station(@stations[@removal_station])
      puts "Станция #{@removal_station} удалена из маршрута"
    else
      puts 'Несуществующий маршрут или станция'
    end
  end

  def follow_route
    if @routs.keys.include?(@route) && @trains.keys.include?(@train_number)
      @trains[@train_number].follow_route(@routs[@route])
      puts "Поезд #{@train_number} следует по маршруту #{@route}"
    else
      puts 'Несуществующий маршрут или поезд'
    end
  end

  def add_carriage
    @train = @trains[@train_number]
    case @train.type
    when 'cargo'
      @train.add_cargo_carriage
    when 'passenger'
      @train.add_passenger_carriage
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
    if !train.current_station.nil?
      train.move_next_station(@routs[@route])
    else
      puts "Поезду #{@train_number} еще не назначен маршрут"
    end
  end

  def move_previous_station
    train = @trains[@train_number]
    if !train.current_station.nil?
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
      print 'Указанный маршрут не существует'
    end
  end

  def show_trains
    station = @stations[@station_name]
    if @stations.keys.include?(@station_name)
      station.trains_on_station do |train|
        puts "Номер поезда: #{train.number}"
        puts "Тип поезда: #{train.type}"
        puts "Количество вагонов: #{train.check_carriage_quantity}"
      end
    else
      print 'Указанная станция не существует'
    end
  end

  def all_carriages
    train = @trains[@train_number]
    if @trains.keys.include?(@train_number)
      train.all_carriages do |carriage|
        puts "Номер вагона: #{carriage.number}"
        puts "Тип вагона: #{@train.type}"
        puts "Количество свободных мест: #{carriage.free_place}"
        puts "Количество занятых мест: #{carriage.used_place}" if train.instance_of?(PassengerTrain)
        puts "Количество занятого объема: #{carriage.used_place}" if train.instance_of?(CargoTrain)
      end
    else
      puts 'Поезд с таким номером не существует. Сначала создайте поезд'
    end
  end

  def take_place
    train = @trains[@train_number]
    case @train.type
    when 'cargo'
      train.carriages[@carriage_number - 1].take_place(volume)
    when 'passenger'
      train.carriages[@carriage_number - 1].take_place
    end
    puts "Место в вагоне #{@carriage_number} занято"
  end

  private

  def volume
    print 'Введите объем, который необходимо занять: '
    volume = gets.to_i
  end
end
