class CreateAcupuncturePoints < ActiveRecord::Migration
  def change
    create_table :acupuncture_points do |t|
      t.string :name
      t.string :description
      t.integer :index
      t.integer :meridian_id

      t.timestamps
    end
  end
end
