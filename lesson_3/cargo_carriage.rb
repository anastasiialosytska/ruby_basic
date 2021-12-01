# frozen_string_literal: true

class CargoCarriage < Carriage
  def take_place(volume)
    @used_place += volume
  end
end
