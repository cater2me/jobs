class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.text :title
      t.string :url
      t.text :note

      t.timestamps
    end
  end
end
