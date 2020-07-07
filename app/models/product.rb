class Product < ApplicationRecord
    attachment :image

    enum product_status: {
        "販売中": 0,
        "売り切れ": 1
    },_prefix: true
end
