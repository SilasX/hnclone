# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    sequence(:url){|n| "http://url#{n}.com"}
    sequence(:title){|n| "Title#{n}"}
  end
end
