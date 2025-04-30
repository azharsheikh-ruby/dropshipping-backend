class Api::V1::OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save
      render json: order, serializer: OrderSerializer, status: :created
      # render json: { message: "Order received", order: order }, status: :created
    else
      render json: { error: order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    orders = Order.all
    render json: orders, each_serializer: OrderSerializer
  end

  private
  def order_params
    params.require(:order).permit(:product_id, :customer_id, :status)
  end
end
