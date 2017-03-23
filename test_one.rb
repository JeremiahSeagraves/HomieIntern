# The DataGenerator class has a CAR_DATA constant that is an Array of OpenStruct objects.
# Each OpenStruct object has two properties:
#   manufacturer: A car manufacturer.
#   models: An array of car models.
#
# Implement the run_test method to generate an array of all possible cars.
# Each array item should be a string in the form "manufacturer: model"
#   Example:
#   [ "Toyota: Camry", "Dodge: Durango", ... ]
  
require_relative 'data_generator'
require 'json'
require 'ostruct'
class TestOne
	DataArray = Struct.new(:manufacturer,:models)
	def run_test()
		array_datos = Array.new()
		data = Dat.car_data()
		#data.each do |index|
  		#	mans = "#{index[:manufacturer]}"
  		#	models = " #{index[:models]}"
  		#	 array_datos.push(index.each_pair.to_a)
  		#	puts mans
  		#	puts models
		#end
		#puts array_datos
		#object = JSON.parse(json, object_class:OpenStruct)
		#object.each do |manufacturer|
		#	puts manufacturer
		#end

=begin
		Todo lo anterior fue cosas que intenté implementar, pero al final no 
		terminé de entenderle y me fui por lo secuencial, supongo que debe 
		haber una forma de hacerlo en un par de líneas.
		Es primer día viendo Ruby, saliendo de la uni.
=end
		data.each do|index|
			man=index[:manufacturer]
			mods=index[:models]
			mods.each do |m_index|
				array_datos.push(man+":"+m_index)
			end
		end
		array_datos.to_json
	end

end
prueba1 = TestOne.new()
puts prueba1.run_test()