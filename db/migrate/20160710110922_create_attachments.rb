class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :post, index: true, foreign_key: true
      t.string :file
      t.string :description

      t.timestamps null: false
    end
  end
end
