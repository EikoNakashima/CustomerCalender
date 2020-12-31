FactoryBot.define do
  factory :event do
    text {"hello!"}
    image {"hoge.png"}
    user
  end
end