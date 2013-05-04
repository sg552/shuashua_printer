# -*- encoding : utf-8 -*-
class AddMeridianTypeToMeridians < ActiveRecord::Migration
  def change
    add_column :meridians, :meridian_type, :string
  end
end
