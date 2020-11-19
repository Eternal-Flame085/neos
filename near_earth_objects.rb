require 'faraday'
require 'figaro'
require 'pry'
require './astroid_api.rb'
require './astroid_methods.rb'
# Load ENV vars via Figaro
Figaro.application = Figaro::Application.new(environment: 'production', path: File.expand_path('../config/application.yml', __FILE__))
Figaro.load

class NearEarthObjects
  def self.find_neos_by_date(date)
    parsed_astroids_data = AsteroidApi.get_astroid_data(date)

    {
      astroid_list: AsteroidMethods.format_astroid_data(parsed_astroids_data),
      biggest_astroid: AsteroidMethods.largest_astroid_diameter(parsed_astroids_data),
      total_number_of_astroids: AsteroidMethods.total(parsed_astroids_data)
    }
  end
end
