class Board < ApplicationRecord
  # ユーザーに所属している
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
end
