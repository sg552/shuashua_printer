# -*- encoding : utf-8 -*-
class Meridian < ActiveRecord::Base
  has_many :acupuncture_points
end
