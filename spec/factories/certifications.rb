# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :certification do
    certifier "MyString"
    certification "MyString"
    start_date "2012-08-22"
    end_date "2012-08-22"
    comment "MyText"
    certifiable_type "MyString"
    certifiable_id 1
  end
end
