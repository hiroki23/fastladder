class AddIndexToDigestOnItems < ActiveRecord::Migration[5.1]
  def change
    add_index :items, :digest
  end
end
