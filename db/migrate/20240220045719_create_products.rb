class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, id: :uuid do |t|
      t.string :title
      t.string :descript
      t.integer :amount
      t.integer :price
      t.boolean :status

      t.timestamps
    end
  end
end
