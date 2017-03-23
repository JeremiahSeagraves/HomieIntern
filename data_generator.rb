######################
# FIX OpenStruct issue
# and use this class as 
# a data generator
######################

require'ostruct'

module Dat
   @CAR_DATA = [
    OpenStruct.new({ :manufacturer => 'Chevrolet', :models => ['Corvette', 'Camaro', 'Suburban', 'S-10'] }),
    OpenStruct.new({ :manufacturer => 'Ford', :models => ['Escort', 'Focus', 'Mustang', 'Bronco'] }),
    OpenStruct.new({ :manufacturer => 'Dodge', :models => ['Charger', 'Viper', 'Durango'] }),
    OpenStruct.new({ :manufacturer => 'Fiat', :models => ['500', '500c', '500 Abarth'] }),
    OpenStruct.new({ :manufacturer => 'BMW', :models => ['535i Sedan', 'M6 Convertible', 'X5', 'M4 Coupe'] }),
  ]
  def self.car_data
    @CAR_DATA
  end
end

  module Col
   @COLORS = [ 'Red', 'Blue', 'Green', 'Yellow', 'Purple', 'Orange' ]

   def self.colors
    @COLORS
  end
 end

class DataGenerator
  CAR_DATA = [
    OpenStruct.new({ :manufacturer => 'Chevrolet', :models => ['Corvette', 'Camaro', 'Suburban', 'S-10'] }),
    OpenStruct.new({ :manufacturer => 'Ford', :models => ['Escort', 'Focus', 'Mustang', 'Bronco'] }),
    OpenStruct.new({ :manufacturer => 'Dodge', :models => ['Charger', 'Viper', 'Durango'] }),
    OpenStruct.new({ :manufacturer => 'Fiat', :models => ['500', '500c', '500 Abarth'] }),
    OpenStruct.new({ :manufacturer => 'BMW', :models => ['535i Sedan', 'M6 Convertible', 'X5', 'M4 Coupe'] }),
  ]

  COLORS = [ 'Red', 'Blue', 'Green', 'Yellow', 'Purple', 'Orange' ]

  def cars(count = 20, dupes = false)
    cars = (1..count).map { build_car }
    if dupes
      (count / 3).times do
        cars[rand(count)] = cars[rand(count)]
      end
    end

    cars
  end

  private

  def build_car
    car = CAR_DATA[rand(CAR_DATA.length)]
    Car.new({
      :price => rand(1000000), #este usaba Money, pero no hallé su uso
      :color => COLORS[rand(COLORS.length)],
      :manufacturer => car.manufacturer,
      :model => car.models[rand(car.models.length)],
      :year => (1970 + rand(40))
    })
  end

end

class Car

  attr_accessor :price, :color, :manufacturer, :model, :year

  def initialize(options = {})
    options.each { |k, v| self.send("#{k}=", v) }
  end

end