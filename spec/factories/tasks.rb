# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    name          "MyString"
    description   "MyText"
    total_seconds 1
    project
  end
end
