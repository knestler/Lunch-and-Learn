require 'rails_helper'

RSpec.describe AirQualityService do 
  describe 'it connects to api and instatiates the facade', vcr: {record: :new_episodes}, type: :request do 
    it 'can reach the api' do
      json_response = File.open('./spec/fixtures/air_quality_fixture.json')
      stub_request(:any, 'http://api.openweathermap.org/data/2.5/air_pollution?lat=50&lon=50&appid=52539237b222aa7bfc7ba991720d7ae6')
        .to_return(status: 200, body: json_response)
      
      response = AirQualityService.quality_search(50, 50)
      expect(response).to be_a Hash
      expect(response).to have_key :coord
      expect(response[:coord]).to have_key :lat
      expect(response[:coord]).to have_key :lon
    end
  end
end

# {
#     "coord": {
#         "lon": 50,
#         "lat": 50
#     },
#     "list": [
#         {
#             "main": {
#                 "aqi": 2
#             },
#             "components": {
#                 "co": 220.3,
#                 "no": 0.07,
#                 "no2": 0.31,
#                 "o3": 81.54,
#                 "so2": 0.37,
#                 "pm2_5": 9.91,
#                 "pm10": 42.54,
#                 "nh3": 0.25
#             },
#             "dt": 1673942881
#         }
#     ]
# }