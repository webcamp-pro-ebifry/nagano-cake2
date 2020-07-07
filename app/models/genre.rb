class Genre < ApplicationRecord
    enum status: {
        "有効": 0,
        "無効": 1
      },_prefix: true
end
