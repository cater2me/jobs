class AddPreviewToPost < ActiveRecord::Migration
  def up
    add_column :posts, :preview, :text
  end
  def down
    remove_column :posts, :preview
  end
end
