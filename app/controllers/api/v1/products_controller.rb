class Api::V1::ProductsController < ApplicationController

  before_action :authorize,  only: %i[index create category show]

  def index
    products = Product.all
    render json: products, each_serializer: ProductSerializer
  end

  def create
    product = Product.new(product_params)
  
    if product.save
      render json: product, serializer: ProductSerializer, status: :created
    else
      render json: { error: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def category
    category_products = Product.where(category:params[:category])
    render json: category_products, each_serializer: ProductSerializer
  end


  def show
    product = Product.find(params[:id])
    render json: product, serializer: ProductSerializer
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock, :image, :source, :category)
  end
end
