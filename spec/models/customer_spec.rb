require 'rails_helper'

RSpec.describe Customer, type: :model do
	it "has a valid customer factory" do
		expect(build(:customer)).to be_valid
	end

	it "should have customer's name, address, postcode, state and phone number" do
		store = create(:store)
		customer = create(:customer, store: store)
		expect(customer).to be_valid
	end

	it "should be invalid if customer's name is empty" do
		store = create(:store)
		customer = build(:customer, store: store, cust_name: nil)
		customer.valid?
		expect(customer.errors[:cust_name]).to include("can't be blank")
	end

	it "should be invalid if customer's address is empty" do
		store = create(:store)
		customer = build(:customer, store: store, cust_address: nil)
		customer.valid?
		expect(customer.errors[:cust_address]).to include("can't be blank")
	end

	it "should be invalid if customer's postcode is empty" do
		store = create(:store)
		customer = build(:customer, store: store, cust_postcode: nil)
		customer.valid?
		expect(customer.errors[:cust_postcode]).to include("can't be blank")
	end

	it "should be invalid if customer's state is empty" do
		store = create(:store)
		customer = build(:customer, store: store, cust_state: nil)
		customer.valid?
		expect(customer.errors[:cust_state]).to include("can't be blank")
	end

	it "should be invalid if customer's phone number is empty" do
		store = create(:store)
		customer = build(:customer, store: store, cust_phone: nil)
		customer.valid?
		expect(customer.errors[:cust_phone]).to include("can't be blank")
	end

	describe "validate customer phone number" do
		context "with a valid phone number" do
			it "should be a valid phone number if it is an integer" do
				store = create(:store)
				customer = build(:customer, store: store, cust_phone: "0123456789")
				customer.valid?
				expect(customer.cust_phone).to eq("0123456789")
			end
		end

		context "with an invalid phone number" do
			it "should be invalid phone number if it is not an integer" do
				store = create(:store)
				customer = build(:customer, store: store, cust_phone: "012345abcd")
				customer.valid?
				expect(customer.cust_phone).not_to eq("0123456789")
			end
		end
	end
end
