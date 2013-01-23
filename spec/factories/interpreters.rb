# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interpreter do
    first_name "Pee"
    last_name "Body"
    miles_willing_to_travel 1
    gender :male
  end
end
