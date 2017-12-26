class CreateMutters < ActiveRecord::Migration[5.1]
  def change
    create_table :mutters do |t|
      t.text :content
      t.references :user, foreign_key: true
    end

  end
end
