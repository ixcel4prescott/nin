# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice_item do
    job_date "2012-09-17"
    calculation_description "MyString"
    amount_cents 1
  end
end
