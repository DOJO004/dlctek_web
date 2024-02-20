class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :descript
      t.integer :amount
      t.integer :price
      t.boolean :status

      t.timestamps
    end
  end
end
