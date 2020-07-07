class Product < ApplicationRecord
    belongs_to :genre

    enum product_status: {
        "販売中": 0,
         "売り切れ": 1
     },_prefix: true


    # enum product_status: {
    #     sale: 0,
    #     soldout: 1
    # },_prefix: true
    
    attachment :image


end
