class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :category
      t.integer :view_count, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
