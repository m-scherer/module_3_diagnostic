class StationsService

  def initialize
    @conn = Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def find_stations(zipcode, radius)
    response = conn.get '/api/alt-fuel-stations/v1/nearest.json', {
                              api_key: ENV["nrel_api_key"],
                              location: zipcode,
                              radius: radius
                              }

    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn

end
