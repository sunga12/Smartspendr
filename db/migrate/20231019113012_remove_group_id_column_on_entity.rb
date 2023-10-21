class RemoveGroupIdColumnOnEntity < ActiveRecord::Migration[7.1]
  def change
    remove_column(:entities, :group_id)
  end
end
