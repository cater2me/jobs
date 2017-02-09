FactoryGirl.define do
  factory :feed do
    url { "http://lorem-rss.herokuapp.com/feed?unit=second&interval=" + (10*rand(6)).to_s }
  end
end
