class RenameBlogIdToMutterId < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :blog_id, :mutter_id
  end
end
