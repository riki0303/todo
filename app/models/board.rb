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
class Board < ApplicationRecord
  # ユーザーに所属している
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_rich_text :description

  validates :name, presence: true
  validates :description, presence: true

  # 投稿日付の標準化
  def display_created_at
    I18n.l(created_at, format: :default)
  end
end
