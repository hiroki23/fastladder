class AddAuthKeyToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :auth_key, :string
  end
end
