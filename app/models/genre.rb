class Genre < ApplicationRecord
    enum status: {
        valid: 0,
        invalid: 1
      },_prefix: true
end
