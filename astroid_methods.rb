class AsteroidMethods
  def self.largest_astroid_diameter(parsed_astroids_data)
    parsed_astroids_data.map do |astroid|
      astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i
    end.max { |a,b| a<=> b}
  end

  def self.total(parsed_astroids_data)
    parsed_astroids_data.count
  end

  def self.format_astroid_data(parsed_astroids_data)
    parsed_astroids_data.map do |astroid|
      {
        name: astroid[:name],
        diameter: "#{astroid[:estimated_diameter][:feet][:estimated_diameter_max].to_i} ft",
        miss_distance: "#{astroid[:close_approach_data][0][:miss_distance][:miles].to_i} miles"
      }
    end
  end
end
