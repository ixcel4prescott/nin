# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reminder_time do
    alert_time "2012-09-17 13:04:22"
    sent_time "2012-09-17 13:04:22"
    acknowledged_time "2012-09-17 13:04:22"
  end
end
