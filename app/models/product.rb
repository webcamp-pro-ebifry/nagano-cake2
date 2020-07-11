class Product < ApplicationRecord
    attachment :image

    enum product_status: {
        "販売中": 0,
        "売り切れ": 1
    },_prefix: true


    belongs_to :genre
    has_many :cart_items
    has_many :order_details, dependent: :destroy
end