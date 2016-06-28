class AddOtherAttributesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page_views, :integer
    add_column :posts, :tags, :string, array: true
    add_column :posts, :extras, :jsonb
  end
end
