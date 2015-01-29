class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.column :name, :string

      t.timestamps null: false
    end
  end
end
