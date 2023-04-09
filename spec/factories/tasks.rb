# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  board_id    :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_tasks_on_board_id  (board_id)
#  index_tasks_on_user_id   (user_id)
#
FactoryBot.define do
  factory :task do
    association :board, factory: :board
    name { Faker::Book.title }
    description { Faker::Book.author }
  end
end
