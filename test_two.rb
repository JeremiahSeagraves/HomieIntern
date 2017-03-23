# Given an array of randomly generated cars,
#return all Car objects  made between 1982 and 1993.

require_relative 'data_generator'
require 'json'
class TestTwo
	def run_test()
		d_gen = DataGenerator.new()
		array_cars = d_gen.cars()
		result = Array.new()
		array_cars.each do |index|
			if index.year>=1982&&index.year<=1993
				result.push(index.manufacturer.to_s+" "+index.model.to_s+" "+index.year.to_s+" "+
					index.color.to_s+" "+index.price.to_s)
			end
		end
			result.to_json
	end
end

prueba2 = TestTwo.new()
puts prueba2.run_test()
