class CreatePornstars < ActiveRecord::Migration
  def change
    create_table :pornstars do |t|
      t.string :name
      t.string :picture

      t.timestamps null: false
    end
  end
end
