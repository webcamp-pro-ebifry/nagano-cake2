class Order < ApplicationRecord
	belongs_to :user
	has_many :order_details, dependent: :destroy

	enum status:{
		"入金待ち": 0,
		"入金確認": 1,
		"制作中": 2,
		"発送準備中": 3,
		"発送済み": 4
	}

end
