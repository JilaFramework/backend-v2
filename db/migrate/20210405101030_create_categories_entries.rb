class CreateCategoriesEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_entries do |t|
      t.integer "category_id"
      t.integer "entry_id"
    end
  end
end
