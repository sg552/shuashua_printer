class Document < ActiveRecord::Base
  has_many :arranged_acupuncture_points
  has_many :acupuncture_points, :through => :arranged_acupuncture_points
end
