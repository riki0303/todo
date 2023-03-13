class Board < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true

   # ユーザーに所属している
   belongs_to :user
end
