class AddDetailsToGroup < ActiveRecord::Migration[7.1]
  def change
    add_column :groups, :name, :string
    add_column :groups, :icon, :string
  end
end
