# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder do
    reminder_type ""
    notification "MyString"
  end
end
