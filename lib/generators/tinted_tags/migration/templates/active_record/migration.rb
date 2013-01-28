class TintedTagsMigration < ActiveRecord::Migration
  def change
    add_column :tags, :tint, :string
  end
end
