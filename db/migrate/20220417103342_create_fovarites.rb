class CreateFovarites < ActiveRecord::Migration[5.2]
  def change
    create_table :fovarites do |t|

      t.timestamps
    end
  end
end
