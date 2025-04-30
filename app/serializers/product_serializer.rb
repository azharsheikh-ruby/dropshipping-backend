# app/serializers/product_serializer.rb
class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :description, :price, :category, :stock, :source, :image

  def image
    object.image.attached? ? url_for(object.image) : nil
  end
end
