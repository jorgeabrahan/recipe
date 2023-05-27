class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, foreign_key: true, index: true
      
      t.string :name
      t.string :measurement_unit
      t.integer :price, default: 1
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
