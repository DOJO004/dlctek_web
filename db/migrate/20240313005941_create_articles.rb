class CreateArticles < ActiveRecord::Migration[7.1]
    def change
        create_table :articles, id: :uuid do |t|
            t.string :title
            t.string :category
            t.integer :view_count, default: 0
            t.references :user, null: false, foreign_key: true, type: :uuid

            t.timestamps
        end
    end
end
