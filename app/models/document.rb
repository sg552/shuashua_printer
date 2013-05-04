# -*- encoding : utf-8 -*-
class Document < ActiveRecord::Base
  has_many :arranged_acupuncture_points
  has_many :acupuncture_points, :through => :arranged_acupuncture_points,
    :include => :meridian

  ['zusanyin', 'shousanyin', 'zusanyang', 'shousanyang'].each do |meridian_type|
    define_method "#{meridian_type}_acupuncture_points" do
      acupuncture_points.where("meridians.meridian_type = ? ", meridian_type).
        order('meridians.name')
    end
  end
end
