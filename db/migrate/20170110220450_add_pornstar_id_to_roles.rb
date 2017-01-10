class AddPornstarIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :pornstar_id, :integer
  end
end
