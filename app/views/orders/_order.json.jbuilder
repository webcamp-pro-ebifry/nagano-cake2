json.extract! order, :id, :user_id, :payment_method, :postage, :payment, :status, :address, :postcode, :name, :created_at, :updated_at
json.url order_url(order, format: :json)
