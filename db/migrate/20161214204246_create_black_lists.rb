class CreateBlackLists < ActiveRecord::Migration[5.0]
  def change
    create_table :black_lists do |t| 
      t.references :user, null:false, foreign_key: true
      t.references :thing, null: false, foreign_key: true
      t.timestamps
    end
  end
end
