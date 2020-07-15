class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    show_item = Merchant.find(params[:id])
    render json: MerchantSerializer.new(show_item)
  end
end
