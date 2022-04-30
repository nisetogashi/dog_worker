class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|

      t.timestamps
      t.integer :user_id
      t.string :name
      t.string :age
      t.string :sex
      t.string :color
      t.string :kind
      t.text :introduction
    end
  end
end
