# frozen_string_literal: true

class PassengerCarriage < Carriage
  def take_place
    @used_place += 1
  end
end
