# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    period_start "2012-09-17"
    period_end "2012-09-17"
    reference "MyString"
  end
end
