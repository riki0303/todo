class Board < ApplicationRecord
  # ユーザーに所属している
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true

  # 投稿日付の標準化
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end
end
