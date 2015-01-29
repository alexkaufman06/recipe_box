class CreateCategoriesRecipes < ActiveRecord::Migration
  def change
    create_table :categories_recipes do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
  end
end
