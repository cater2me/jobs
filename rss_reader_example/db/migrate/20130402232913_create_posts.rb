class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :author
      t.text :content
      t.integer :feed_id

      t.timestamps
    end
  end
end
