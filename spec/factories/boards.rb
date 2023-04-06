FactoryBot.define do
  factory :board do
    name { Faker::Book.title }
    description { Faker::Book.author }
  end
end
