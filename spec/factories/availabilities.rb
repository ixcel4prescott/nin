# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :availability do
    day_of_week "MyString"
    start_time "2012-08-22 14:33:31"
    end_time "2012-08-22 14:33:31"
    exception_date "2012-08-22"
    not_available false
    interpreter_id 1
  end
end
