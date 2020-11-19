class AsteroidApi

  def self.get_astroid_data(date)
    conn = Faraday.new(
      url: 'https://api.nasa.gov',
      params: { start_date: date, api_key: ENV['nasa_api_key']}
    )
    parse_astroid_data(conn.get('/neo/rest/v1/feed'), date)
  end

  def self.parse_astroid_data(astroids_list_data, date)
    JSON.parse(astroids_list_data.body, symbolize_names: true)[:near_earth_objects][:"#{date}"]
  end
end
