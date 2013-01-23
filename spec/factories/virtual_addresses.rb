# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :virtual_address do
    contact_type "MyString"
    contact_value "MyString"
    contact_label "MyString"
    virtual_addressable_type "MyString"
    virtual_addressable_id 1
  end
end
