class CreateViewCounts < ActiveRecord::Migration
  def change
    create_table :view_counts do |t|
      t.integer :article_id
      t.string :client_ip

      t.timestamps null:false
    end
  end
end
