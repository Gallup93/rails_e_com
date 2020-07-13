require 'rails_helper'
describe "expose ReST end points" do

  def conn(uri)
    url = ENV['RAILS_ENGINE_DOMAIN'] + uri
    Faraday.new(url)
  end

  describe "Merchants" do
    it "can return list of merchants" do
      create_list(:merchant, 5)
      response = conn('/api/v1/merchants').get

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data].length).to eq(100)
      json[:data].each do |merchant|
        expect(merchant[:type]).to eq("merchant")
        expect(merchant[:attributes]).to have_key(:name)
      end
    end
  end
end
