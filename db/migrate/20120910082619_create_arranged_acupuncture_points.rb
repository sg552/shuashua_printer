# -*- encoding : utf-8 -*-
class CreateArrangedAcupuncturePoints < ActiveRecord::Migration
  def change
    create_table :arranged_acupuncture_points do |t|
      t.integer :document_id
      t.integer :index
      t.integer :acupuncture_point_id

      t.timestamps
    end
  end
end
