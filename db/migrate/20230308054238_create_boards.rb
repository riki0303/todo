class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.string :name
      t.text :description

      # referencesでもテーブルを紐つけられる
      # t.integer :user_id, null: false # 追加

      t.timestamps
    end
    # add_index :boards, :user_id # 追加
    # add_foreign_key :boards, :users  # 追加
  end
end
