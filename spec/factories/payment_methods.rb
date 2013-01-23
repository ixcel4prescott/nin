# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment_method do
    payment_type ""
    paypal_account "MyString"
    bank_name "MyString"
    bank_routing "MyString"
    bank_account "MyString"
  end
end
