class CreateEntries < ActiveRecord::Migration
  # this corresponds to SimpleRSS's fields parsing
  def change
    create_table :entries do |t|
      t.string :title
      t.string :link
      # author
      t.string :author
      t.string :contributor
      t.string :dc_creator

      # published date
      t.string :pubDate
      t.string :published
      t.string :dc_date

      # content
      t.text :description
      t.text :summary
      t.text :content
      t.text :content_encoded

      # media
      t.string :media_content_url
      t.string :media_title
      t.string :media_thumbnail_url
      t.string :guid
      t.integer :feed_id
      t.text :preview_html

      t.timestamps null: false
    end
    add_index :entries, :feed_id
    add_index :entries, :guid, unique: true
    remove_column :feeds, :note, :text
  end
end
