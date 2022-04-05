class RemoveUnitAndQuantityFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :unit, :string
    remove_column :ingredients, :quantity, :float
  end
end
