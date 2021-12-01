# frozen_string_literal: true

class PassengerTrain < Train
  def add_passenger_carriage
    @carriage_number = check_carriage_quantity + 1
    print 'Укажите количество мест в вагоне: '
    @place_quantity = gets.to_i
    add_carriage(PassengerCarriage.new(@place_quantity, 'passenger', @carriage_number))
    puts "К поезду #{number} прицеплен пассажирский вагон #{@carriage_number}"
  end
end
