class AddIsEnabledToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_enabled, :boolean, default: true
  end
end
