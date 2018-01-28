FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    website_url { Faker::Internet.url }
  end
end
