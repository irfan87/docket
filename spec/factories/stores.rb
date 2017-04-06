FactoryGirl.define do
  factory :store do
    store_name {FFaker::Company.suffix}
    store_address {FFaker::AddressUK.street_name}
    store_postcode {FFaker::AddressUK.postcode}
    store_state {FFaker::AddressUS.us_state}
    store_phone {FFaker::PhoneNumber.phone_number}
  end
end
