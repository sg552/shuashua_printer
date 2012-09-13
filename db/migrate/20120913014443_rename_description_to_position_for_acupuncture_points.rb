class RenameDescriptionToPositionForAcupuncturePoints < ActiveRecord::Migration
  def change
    rename_column :acupuncture_points, :description, :position
  end
end
