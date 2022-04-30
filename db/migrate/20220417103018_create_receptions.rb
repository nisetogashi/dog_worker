class CreateReceptions < ActiveRecord::Migration[5.2]
  def change
    create_table :receptions do |t|

      t.timestamps
      t.integer :sitter_id
      t.string :price
      t.text :introduction
    end
  end
end
