# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_request do
    request_type ""
    request_status ""
    start_datetime "2012-09-16 13:26:44"
    recurring ""
  end
end
