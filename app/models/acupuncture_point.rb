# -*- encoding : utf-8 -*-
class AcupuncturePoint < ActiveRecord::Base
  belongs_to :meridian
  has_many :arranged_acupuncture_points
  has_many :documents, :through => :arranged_acupuncture_points
end
