FactoryBot.define do
  factory :board do
    name {Faker::JapaneseMedia::Naruto}
    description {Faker::JapaneseMedia::OnePiece}
  end
end