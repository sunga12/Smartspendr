class CreateEntityGroup < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_groups do |t|
      t.references :entity, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
