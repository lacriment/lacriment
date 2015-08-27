class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :email
      t.string :name
      t.text :body
      t.boolean :visible, default: false
      t.string :client_ip

      t.timestamps null: false
    end
  end
end
