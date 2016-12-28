class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.references :user, null:false, foreign_key: true
      t.references :user2, null:false, foreign_key: true
      t.references :thing, null:false, foreign_key: true
      t.references :thing2, null:false, foreign_key: true

      t.timestamps
    end
  end
end
