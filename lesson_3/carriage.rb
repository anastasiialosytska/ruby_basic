class Carriage

  include ManufacturerName
  include Valid
  attr_reader :type

  def initialize(type)
    @type = type
  end

  private

  def validate! 
    errors = []

    errors << "Неверный тип вагона" if @type != "passenger" && @type != "cargo"
    errors << "Не указан тип вагона" if @type == nil

    raise errors.join(';') unless errors.empty?
  end
end
