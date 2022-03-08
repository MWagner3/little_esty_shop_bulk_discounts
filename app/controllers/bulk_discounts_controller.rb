class BulkDiscountsController < ApplicationController
  def index
   @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    @merchant = Merchant.find(params[:merchant_id])
    @merchant.bulk_discounts.create!(bulk_discount_params)
    redirect_to "/merchant/#{@merchant.id}/bulk_discounts"
  end

  def destroy
    @merchant = Merchant.find(params[:merchant_id])
    BulkDiscount.find(params[:id]).destroy
    redirect_to "/merchant/#{@merchant.id}/bulk_discounts"
  end

  private
  def bulk_discount_params
    params.permit(:percentage_discount, :quantity_threshold)
  end
end
