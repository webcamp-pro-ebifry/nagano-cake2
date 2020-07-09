class Genre < ApplicationRecord
    has_many :products
    enum status: {
        "有効": 0,
        "無効": 1
      },_prefix: true

     has_many :products, dependent: :destroy
end
