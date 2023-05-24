class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.references :food, foreign_key: true, index: true
      t.references :recipe, foreign_key: true, index: true
      
      t.integer :quantity, default: 0
      
      t.timestamps
    end
  end
end
