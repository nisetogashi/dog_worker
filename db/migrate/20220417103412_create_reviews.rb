class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :customer_id
      t.integer :sitter_id
      t.string :review
      t.text :introduction
      t.float :rate
    end
  end
end
