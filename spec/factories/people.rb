# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    prefix_name "MyString"
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    postfix_name "MyString"
    preferred_language "MyString"
    gender "male"
    dob "2012-08-22"
    user_id 1
  end
end
