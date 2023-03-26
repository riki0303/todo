class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      # following_idを作成
      t.references :following, null: false, foreign_key: { to_table: :users }
      # follower_idを作成
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
