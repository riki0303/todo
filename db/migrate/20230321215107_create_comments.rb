class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false
      t.references :task, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
