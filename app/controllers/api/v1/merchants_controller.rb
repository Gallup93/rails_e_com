class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    show_item = Merchant.find(params[:id])
    render json: MerchantSerializer.new(show_item)
  end

  def create
    ActiveRecord::Base.connection.reset_pk_sequence!('merchants')
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end

  def update
    render json: MerchantSerializer.new(Merchant.update(params[:id], merchant_params))
  end

  def destroy
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
    Merchant.delete(params[:id])
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
