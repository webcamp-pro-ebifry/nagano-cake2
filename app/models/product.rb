class Product < ApplicationRecord
        enum product_status: {
            sale: 0,
            soldout: 1
        },_prefix: true
end
