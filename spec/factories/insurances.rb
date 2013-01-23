# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :insurance do
    carrier "MyString"
    account "MyString"
    coverage 1
  end
end
