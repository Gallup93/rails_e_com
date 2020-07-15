require 'rails_helper'

def conn(uri)
  url = ENV['RAILS_ENGINE_DOMAIN'] + uri
  Faraday.new(url)
end

describe "Items API" do
  it "sends a list of items" do

    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"].count).to eq(3)
    expect(items["data"].last["attributes"]["name"]).to eq(Item.last.name)
    expect(items["data"].last["attributes"]["description"]).to eq(Item.last.description)
    expect(items["data"].last["attributes"]["unit_price"]).to eq(Item.last.unit_price)
  end

  it "sends a single item" do
    create_list(:item, 3)
    test_item = Item.all[1]

    get "/api/v1/items/#{test_item.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"]["id"].to_i).to eq(test_item.id)
  end

  it "creates/deletes a new item" do
    name = "Shiny Itemy Item"
    description = "It does a lot of things real good"
    unit_price = 5011.96
    merchant_id = 43

    body = {
    name: name,
    description: description,
    unit_price: unit_price,
    merchant_id: merchant_id
    }

    # Create a item
    response = conn('/api/v1/items').post do |request|
      request.body = body
    end

    json = JSON.parse(response.body, symbolize_names: true)

    new_item = json[:data]
    expect(new_item[:attributes][:name]).to eq(name)
    expect(new_item[:attributes][:description]).to eq(description)
    expect(new_item[:attributes][:unit_price]).to eq(unit_price)
    expect(new_item[:attributes][:merchant_id]).to eq(merchant_id)

    # Delete a item
    delete_response = conn("/api/v1/items/#{new_item[:id]}").delete

    json = JSON.parse(delete_response.body, symbolize_names: true)

    deleted_item = json[:data]

    expect(deleted_item[:attributes][:name]).to eq(name)
    expect(deleted_item[:attributes][:description]).to eq(description)
    expect(deleted_item[:attributes][:unit_price]).to eq(unit_price)
    expect(deleted_item[:attributes][:merchant_id]).to eq(merchant_id)
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
      item = json[:data][0]

      expect(item[:attributes][:name]).to eq("Big Ol New THING")
      expect(item[:attributes][:description]).to eq(description)
      expect(item[:attributes][:unit_price]).to eq(unit_price)
      expect(item[:attributes][:merchant_id]).to eq(merchant_id)
    end
end
