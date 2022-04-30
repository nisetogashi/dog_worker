class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      t.timestamps
      t.integer :customer_id
      t.string :review
      t.text :introduction
    end
  end
end
