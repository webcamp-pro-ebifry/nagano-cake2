json.extract! order_detail, :id, :product_id, :order_id, :count, :price, :status, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
