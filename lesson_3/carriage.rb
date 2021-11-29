class Carriage

  include ManufacturerName
  include Valid
  attr_reader :type, :total_place, :used_place, :number

  def initialize(type, total_place, number)
    @type = type
    @total_place = total_place
    @used_place = 0
    @number = number
  end

  def free_place
    total_place - used_place
  end

  def take_place
    raise 'not implemented'
  end

  private

  def validate! 
    errors = []

    errors << "Неверный тип вагона" if @type != "passenger" && @type != "cargo"
    errors << "Не указан тип вагона" if @type == nil

    raise errors.join(';') unless errors.empty?
  end
end
