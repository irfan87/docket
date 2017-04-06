class Customer < ApplicationRecord
	belongs_to :store

	validates_presence_of :cust_name
	validates_presence_of :cust_address
	validates_presence_of :cust_postcode
	validates_presence_of :cust_state
	validates_presence_of :cust_phone
	validates_numericality_of :cust_phone
end
