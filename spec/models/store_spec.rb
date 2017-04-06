require 'rails_helper'

RSpec.describe Store, type: :model do
	it "should have store name, address postcode, state and phone number" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '0123456789')
		expect(store).to be_valid
	end

	it "should not be valid if store not have name" do
		store = Store.new(store_name: nil)
		store.valid?
		expect(store.errors[:store_name]).to include("can't be blank")
	end

	it "should not be valid if store not have address" do
		store = Store.new(store_address: nil)
		store.valid?
		expect(store.errors[:store_address]).to include("can't be blank")
	end

	it "should not be valid if store not have postcode" do
		store = Store.new(store_postcode: nil)
		store.valid?
		expect(store.errors[:store_postcode]).to include("can't be blank")
	end

	it "should not be valid if store not have state" do
		store = Store.new(store_state: nil)
		store.valid?
		expect(store.errors[:store_state]).to include("can't be blank")
	end

	it "should not be valid if store not have phone" do
		store = Store.new(store_phone: nil)
		store.valid?
		expect(store.errors[:store_phone]).to include("can't be blank")
	end

	it "should not have same store name" do
		Store.create(store_name: 'Test Store', store_address: 'KLCC', store_postcode: 12345, store_state: 'Kuala Lumpur', store_phone: '0123456789')
		store = Store.new(store_name: 'Test Store', store_address: 'Bandar Melaka', store_postcode: 12346, store_state: 'Melaka', store_phone: '0123456780')

		store.valid?
		expect(store.errors[:store_name]).to include("has already been taken")
	end
end
