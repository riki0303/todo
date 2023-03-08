class Board < ApplicationRecord
  
  # ユーザーに所属している
  belongs_to :user
end
