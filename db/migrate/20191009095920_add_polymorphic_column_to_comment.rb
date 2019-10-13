class AddPolymorphicColumnToComment < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :category_id, :integer
    remove_column :comments, :item_type, :string


    add_column :comments, :item_id, :integer
    add_column :comments, :item_type, :string
  end
end
