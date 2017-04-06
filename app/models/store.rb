class Store < ApplicationRecord
	validates_presence_of :store_name
	validates_presence_of :store_address
	validates_presence_of :store_postcode
	validates_presence_of :store_state
	validates_presence_of :store_phone

	validates_uniqueness_of :store_name

	has_many :customers
end
