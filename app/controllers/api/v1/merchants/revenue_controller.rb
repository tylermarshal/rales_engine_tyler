class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    render json: Merchant.all_revenue_by_date(revenue_params[:date]), serializer: RevenueSerializer
  end

  def show
    if params[:date]
      render json: Merchant.revenue_on_date(params[:id], revenue_params[:date]), serializer: RevenueSerializer
    else
      render json: Merchant.revenue(params[:id]), serializer: RevenueSerializer
    end
  end

  private

  def revenue_params
    if params[:date]
      params[:date] = params[:date].to_datetime
    end
    params.permit(:id, :date)
  end

end
