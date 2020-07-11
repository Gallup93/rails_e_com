class RemoveSeedIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seed_id, :int
  end
end
