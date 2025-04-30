class OrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :product_id, :customer_id, :status
end