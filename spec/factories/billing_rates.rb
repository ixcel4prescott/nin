# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :billing_rate do
    title "MyString"
    increment_rate 1
    increment_type "MyString"
    start_time "2012-08-22 15:31:08"
    end_time "2012-08-22 15:31:08"
    min_increments 1
    overtime_threshold 1
    overtime_rate 1
    billing_rate_schedule_id 1
  end
end
