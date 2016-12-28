class CreateThings < ActiveRecord::Migration[5.0]
  def change
    create_table :things do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.references :user, null:false, foreign_key: true

      t.timestamps
    end
  end
end
