# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    skill_type "legal"
    experience 1
    where "location"
  end
end
