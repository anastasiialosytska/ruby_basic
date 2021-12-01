# frozen_string_literal: true

module UserMenu
  attr_accessor :input

  def call
    loop do
      puts '1. Создать станцию'
      puts '2. Создать поезд'
      puts '3. Создать маршрут'
      puts '4. Добавить станцию на маршрут'
      puts '5. Удалить станцию с маршрута'
      puts '6. Назначить маршрут поезду'
      puts '7. Добавить вагон к поезду'
      puts '8. Отцепить вагон от поезда'
      puts '9. Переместить поезд на следующую станцию'
      puts '10. Переместить поезд на предыдущую станцию'
      puts '11. Посмотреть список станций на маршруте'
      puts '12. Посмотреть список поездов на станции'
      puts '13. Просмотреть список вагонов поезда'
      puts '14. Занять место в вагоне'
      puts '0. Выход'
      print 'Выберите вариант: '
      self.input = gets.to_i
      break if input.zero?

      case input
      when 1
        print 'Введите название станции: '
        @station_name = gets.chomp
        create_station
      when 2
        puts 'Выберите тип поезда:'
        puts '1. Пассажирский'
        puts '2. Грузовой'
        @train_type = gets.to_i
        begin
          print 'Введите номер поезда: '
          @train_number = gets.chomp
          create_train
        rescue StandardError
          puts 'Некорректный номер поезда. Укажите номер в формате ХХХ-ХХ'
          retry
        end
      when 3
        print 'Введите начальную станцию: '
        @first_station = gets.chomp
        print 'Введите конечную станцию: '
        @last_station = gets.chomp
        create_route
      when 4
        print 'Введите название маршрута: '
        @route = gets.chomp
        print 'Введите название станции, которую хотите добавить в маршрут: '
        @new_station = gets.chomp
        add_station
      when 5
        print 'Введите название маршрута: '
        @route = gets.chomp
        print 'Введите название станции, которую хотите удалить из маршрута: '
        @removal_station = gets.chomp
        delete_station
      when 6
        print 'Введите номер поезда, которому необходимо назначить маршрут: '
        @train_number = gets.chomp
        print 'Введите название маршрута: '
        @route = gets.chomp
        follow_route
      when 7
        print 'Введите номер поезда, к которому необходимо прицепить вагон: '
        @train_number = gets.chomp
        add_carriage
      when 8
        print 'Введите номер поезда, от которого необходимо отцепить вагон: '
        @train_number = gets.chomp
        delete_carriage
      when 9
        print 'Введите номер поезда: '
        @train_number = gets.chomp
        print 'Введите название маршрута: '
        @route = gets.chomp
        move_next_station
      when 10
        print 'Введите номер поезда: '
        @train_number = gets.chomp
        print 'Введите название маршрута: '
        @route = gets.chomp
        move_previous_station
      when 11
        print 'Введите название маршрута: '
        @route = gets.chomp
        show_stations
      when 12
        print 'Введите название станции: '
        @station_name = gets.chomp
        show_trains
      when 13
        print 'Введите номер поезда: '
        @train_number = gets.chomp
        all_carriages
      when 14
        print 'Введите номер поезда: '
        @train_number = gets.chomp
        print 'Введите номер вагона: '
        @carriage_number = gets.to_i
        take_place
      end
    end
  end
end
