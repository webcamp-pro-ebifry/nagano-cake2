class Product < ApplicationRecord
    attachment :image

    enum product_status: {
        "販売中": 0,
        "売り切れ": 1
    },_prefix: true


    enum product_status: {
        sale: 0,
        soldout: 1
    },_prefix: true

<<<<<<< HEAD
    attachment :image
    has_many :genres, dependent: :destroy

=======
    has_many :genres, dependent: :destroy
>>>>>>> dd816ab61001f4f5bb2d41b0eea5f5dabe74c07c
end
