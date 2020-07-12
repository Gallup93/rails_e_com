class AddSeedIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seed_id, :integer
  end
end
