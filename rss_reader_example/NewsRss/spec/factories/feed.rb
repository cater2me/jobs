FactoryGirl.define do
  factory :feed do
    title { "Lorem ipsum feed for an interval of 10 seconds" }
    url  { "http://lorem-rss.herokuapp.com/feed?unit=second&interval=10" }
  end
end
