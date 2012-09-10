class AcupuncturePoint < ActiveRecord::Base
  belongs_to :Meridian
  has_many :arranged_acupuncture_points
end
