class AddFieldsToLinks < ActiveRecord::Migration
  def change
    add_column :links, :url, :text
    add_column :links, :title, :text
    add_column :links, :description, :text
    add_reference :links, :user, index: true
  end
end
