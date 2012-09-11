class AcupuncturePoint < ActiveRecord::Base
  belongs_to :meridian
  has_many :arranged_acupuncture_points
end
