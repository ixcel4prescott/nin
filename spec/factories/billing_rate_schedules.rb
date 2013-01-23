# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_rate_schedule do
    date_from "2012-08-26"
    date_to "2012-08-26"
    billing_plan_id 1
  end
end
