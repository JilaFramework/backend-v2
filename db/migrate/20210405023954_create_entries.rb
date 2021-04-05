class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :entry_word
      t.string :word_type
      t.text :description
      t.boolean :published?
      t.timestamps
      t.integer :display_order
      t.string :pronunciation
      t.string :meaning
      t.string :example
      t.string :example_translation
    end
  end
end
