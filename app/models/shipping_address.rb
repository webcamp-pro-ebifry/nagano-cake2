class ShippingAddress < ApplicationRecord
	belongs_to :user

	validates :postcode, presence: true
	validates :address, presence: true
	validates :name, presence: true
end
