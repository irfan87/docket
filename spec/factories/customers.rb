FactoryGirl.define do
  factory :customer do
  	association :store
    cust_name {FFaker::Name.first_name}
    cust_address {FFaker::AddressUK.street_name}
    cust_postcode {FFaker::AddressUK.postcode}
    cust_state {FFaker::AddressUS.us_state}
    cust_phone {FFaker::PhoneNumber.phone_number}
  end
end
