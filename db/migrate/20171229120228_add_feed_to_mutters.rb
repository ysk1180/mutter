class AddFeedToMutters < ActiveRecord::Migration[5.1]
  def change
    add_column :mutters, :feed, :text
  end
end
