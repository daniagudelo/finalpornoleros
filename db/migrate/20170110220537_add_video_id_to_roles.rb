class AddVideoIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :video_id, :integer
  end
end
