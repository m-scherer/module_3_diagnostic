class StationsService

  def initialize
    @conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.request  :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_stations(zipcode, radius)
    response = conn.get '/api/alt-fuel-stations/v1/nearest.json', {
                              api_key: ENV["nrel_api_key"],
                              location: zipcode,
                              radius: radius,
                              fuel_type: "ELEC,LPG"
                              }

    parsed_response = JSON.parse(response.body, symbolize_names: true)
    parsed_response[:fuel_stations]
  end

  private
    attr_reader :conn

end
