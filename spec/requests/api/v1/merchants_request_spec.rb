require 'rails_helper'
describe "expose ReST end points" do

  def conn(uri)
    url = ENV['RAILS_ENGINE_DOMAIN'] + uri
    Faraday.new(url)
  end

  describe "Merchants" do
    it "can return list of merchants" do
      response = conn('/api/v1/merchants').get

      json = JSON.parse(response.body, symbolize_names: true)

      # expect(json[:data].length).to eq(100)
      json[:data].each do |merchant|
        expect(merchant[:type]).to eq("merchant")
        expect(merchant[:attributes]).to have_key(:name)
      end
    end

    it "can return a single merchant" do
      response = conn('/api/v1/merchants/42').get

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to eq('42')
      expect(json[:data][:attributes][:name]).to eq('Glover Inc')
    end
  end

  it "creates/deletes a new merchant" do
    name = "Monster Shop"

    body = {
    name: name
    }

    # Create a merchant
    response = conn('/api/v1/merchants').post do |request|
      request.body = body
    end

    json = JSON.parse(response.body, symbolize_names: true)

    new_merchant = json[:data]

    expect(new_merchant[:attributes][:name]).to eq(name)

    # Delete a item
    delete_response = conn("/api/v1/merchants/#{new_merchant[:id]}").delete

    json = JSON.parse(delete_response.body, symbolize_names: true)

    deleted_item = json[:data]

    expect(deleted_item[:attributes][:name]).to eq(name)
  end

  it "updates an item" do
    create_list(:item, 3)

    name = "Big Ol New THING"
      description = Item.first.description
      unit_price = Item.first.unit_price
      merchant_id = Item.first.merchant_id

      body = {
        name: name,
        description: description,
        unit_price: unit_price,
        merchant_id: merchant_id
      }

      response = conn("/api/v1/items/#{Item.first.id}").patch do |request|
        request.body = body
      end

      json = JSON.parse(response.body, symbolize_names: true)
      item = json[:data]

      expect(item[:attributes][:name]).to eq("Big Ol New THING")
      expect(item[:attributes][:description]).to eq(description)
      expect(item[:attributes][:unit_price]).to eq(unit_price)
      expect(item[:attributes][:merchant_id]).to eq(merchant_id)
    end
end
