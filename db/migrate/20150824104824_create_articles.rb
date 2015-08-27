class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :tags
      t.text :body
      t.integer :views, default: 0
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
