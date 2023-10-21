class RenameUserIdColumnOnGroup < ActiveRecord::Migration[7.1]
  def change
    rename_column(:groups, :user_id, :author_id)
  end
end
