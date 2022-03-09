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

  def edit
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = @merchant.bulk_discounts.find(params[:id])
  end

  def update
    @merchant = Merchant.find(params[:merchant_id])
    @bulk_discount = @merchant.bulk_discounts.find(params[:id])
    @bulk_discount.update(bulk_discount_params)
    @bulk_discount.save
    redirect_to "/merchant/#{@merchant.id}/bulk_discounts/#{@bulk_discount.id}"
  end

  private
  def bulk_discount_params
    params.permit(:percentage_discount, :quantity_threshold)
  end
end
