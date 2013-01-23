# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job_assignment do
    status ""
    scheduled_start "2012-09-16 15:13:28"
    estimated_end "2012-09-16 15:13:28"
    actual_start "2012-09-16 15:13:28"
    actual_end "2012-09-16 15:13:28"
  end
end
