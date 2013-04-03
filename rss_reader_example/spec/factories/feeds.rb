# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :feed do
    url "http://feeds.feedburner.com/PaulDixExplainsNothing"
    title "Paul Dix"
  end
end
