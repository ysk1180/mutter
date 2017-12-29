class RenameFeedColumnToMutters < ActiveRecord::Migration[5.1]
  def change
    rename_column :mutters, :feed, :image
  end
end
