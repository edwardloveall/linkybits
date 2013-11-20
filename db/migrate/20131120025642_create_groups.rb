class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
    end

    create_table :groups_users do |t|
      t.belongs_to :group
      t.belongs_to :user
    end

    add_reference :links, :group, index: true
  end
end
