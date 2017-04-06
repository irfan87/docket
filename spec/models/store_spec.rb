require 'rails_helper'

RSpec.describe Store, type: :model do
	it "has a valid store factory" do
		expect(build(:store)).to be_valid
	end

	it "should have name, address postcode, state and phone number" do
		store = build(:store)
		expect(store).to be_valid
	end

	it "should be invalid if store not have name" do
		store = build(:store, store_name: nil)
		store.valid?
		expect(store.errors[:store_name]).to include("can't be blank")
	end

	it "should be invalid if store not have address" do
		store = build(:store, store_address: nil)
		store.valid?
		expect(store.errors[:store_address]).to include("can't be blank")
	end

	it "should be invalid if store not have postcode" do
		store = build(:store, store_postcode: nil)
		store.valid?
		expect(store.errors[:store_postcode]).to include("can't be blank")
	end

	it "should be invalid if store not have state" do
		store = build(:store, store_state: nil)
		store.valid?
		expect(store.errors[:store_state]).to include("can't be blank")
	end

	it "should be invalid if store not have phone" do
		store = build(:store, store_phone: nil)
		store.valid?
		expect(store.errors[:store_phone]).to include("can't be blank")
	end

	it "should be invalid if have same name" do
		create(:store, store_name: 'Test Store')
		store = build(:store, store_name: 'Test Store')

		store.valid?
		expect(store.errors[:store_name]).to include("has already been taken")
	end

	describe "validate store phone number" do
		context "with valid store phone number" do
			it "should be valid if store phone number is an integer" do
				store = create(:store, store_name: 'Test Store', store_address: 'KLCC', store_postcode: 12345, store_state: 'Kuala Lumpur', store_phone: '0123456789')
				expect(store.store_phone).to eq('0123456789')
			end
		end

		context "with invalid store phone number" do
			it "should be invalid if store phone number is not an integer" do
				store = build(:store, store_name: 'Test Store', store_address: 'KLCC', store_postcode: 12345, store_state: 'Kuala Lumpur', store_phone: '012345abcd')
				expect(store.store_phone).not_to eq('0123456789')
			end
		end
	end
end
