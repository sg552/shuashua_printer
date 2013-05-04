class AddPositionToMeridians < ActiveRecord::Migration
  def change
    add_column :meridians, :position, :text
  end
end
