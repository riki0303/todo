class RemoveDescriptionFromBoard < ActiveRecord::Migration[7.0]
  def change
    remove_column :boards, :description
  end
end
