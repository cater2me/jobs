class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :pubDate
      t.string :guid
      t.string :dc_creator
      t.text :preview_html
      t.text :content_encoded
      t.integer :feed_id

      t.timestamps null: false
    end
    add_index :entries, :feed_id
    add_index :entries, :guid, unique: true
    remove_column :feeds, :note, :text
  end
end
