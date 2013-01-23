# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contract do
    start_date "2012-08-26"
    end_date "2012-08-26"
    contractable_type "MyString"
    contractable_id 1
  end
end
