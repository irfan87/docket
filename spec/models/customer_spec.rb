require 'rails_helper'

RSpec.describe Customer, type: :model do
	it "should have customer's name, address, postcode, state and phone number" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.create(cust_name: 'Test Customer Name', cust_address: 'Test Customer Address', cust_postcode: 12344, cust_state: 'Test Customer State', cust_phone: '012345678')
		expect(customer).to be_valid
	end

	it "should be invalid if customer's name is empty" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.new(cust_name: nil)
		customer.valid?
		expect(customer.errors[:cust_name]).to include("can't be blank")
	end

	it "should be invalid if customer's address is empty" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.new(cust_address: nil)
		customer.valid?
		expect(customer.errors[:cust_address]).to include("can't be blank")
	end

	it "should be invalid if customer's postcode is empty" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.new(cust_postcode: nil)
		customer.valid?
		expect(customer.errors[:cust_postcode]).to include("can't be blank")
	end

	it "should be invalid if customer's state is empty" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.new(cust_state: nil)
		customer.valid?
		expect(customer.errors[:cust_state]).to include("can't be blank")
	end

	it "should be invalid if customer's phone number is empty" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.new(cust_phone: nil)
		customer.valid?
		expect(customer.errors[:cust_phone]).to include("can't be blank")
	end

	it "should return valid customer's phone number as integer" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.create(cust_name: 'Test Customer Name', cust_address: 'Test Customer Address', cust_postcode: 12344, cust_state: 'Test Customer State', cust_phone: "0123456789")
		customer.valid?
		expect(customer.cust_phone).to eq("0123456789")
	end

	it "should not return invalid customer's phone number if not an integer" do
		store = Store.create(store_name: 'Test Store', store_address: 'Test Address', store_postcode: 12345, store_state: 'Test State', store_phone: '012345689')
		customer = store.customers.create(cust_name: 'Test Customer Name', cust_address: 'Test Customer Address', cust_postcode: 12344, cust_state: 'Test Customer State', cust_phone: '012345abcd')
		customer.valid?
		expect(customer.cust_phone).not_to eq('0123456789')
	end
end
