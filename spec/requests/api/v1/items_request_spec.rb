require 'rails_helper'

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

  it "send a single item" do
    create_list(:item, 3)
    test_item = Item.all[1]

    get "/api/v1/items/#{test_item.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items["data"]["id"].to_i).to eq(test_item.id)
  end
end
