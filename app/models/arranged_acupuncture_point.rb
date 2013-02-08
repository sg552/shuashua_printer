# -*- encoding : utf-8 -*-
class ArrangedAcupuncturePoint < ActiveRecord::Base
  belongs_to :acupuncture_point
  belongs_to :document
end
