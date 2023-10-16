class AddDetailsToEntity < ActiveRecord::Migration[7.1]
  def change
    add_column :entities, :name, :string
    add_column :entities, :amount, :float
  end
end
