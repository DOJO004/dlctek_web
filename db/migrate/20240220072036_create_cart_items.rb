class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items, id: :uuid do |t|
      t.references :cart, null: false, foreign_key: true, type: :uuid
      t.integer :product_id
      t.integer :amount

      t.timestamps
    end
  end
end
