class CreateMeridians < ActiveRecord::Migration
  def change
    create_table :meridians do |t|
      t.string :name

      t.timestamps
    end
  end
end
