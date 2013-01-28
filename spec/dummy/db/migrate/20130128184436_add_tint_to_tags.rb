class AddTintToTags < ActiveRecord::Migration
  def change
    add_column :tags, :tint, :string
  end
end
