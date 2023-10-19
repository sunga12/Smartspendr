class RenameEntityGroupsTable < ActiveRecord::Migration[7.1]
  def change
    rename_table 'entity_groups', 'entities_groups'
  end
end
