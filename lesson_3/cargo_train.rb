# frozen_string_literal: true

class CargoTrain < Train
  def add_cargo_carriage
    @carriage_number = check_carriage_quantity + 1
    print 'Укажите объем вагона: '
    @place_quantity = gets.to_i
    add_carriage(CargoCarriage.new(@place_quantity, 'cargo', @carriage_number))
    puts "К поезду #{number} прицеплен грузовой вагон #{@carriage_number}"
  end
end
