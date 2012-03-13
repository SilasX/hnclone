# Read about factories at https://github.com/thoughtbot/factory_girl

Factory.sequence(:url) {|n| "http://myurl#{n}.com"}
FactoryGirl.define do
  factory :link do
    url { Factory.next :url }
    title "My Title"
  end
end
