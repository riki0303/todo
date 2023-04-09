# == Schema Information
#
# Table name: boards
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
FactoryBot.define do
  factory :board do
    name { Faker::Book.title }
    description { Faker::Book.author }
  end
end
