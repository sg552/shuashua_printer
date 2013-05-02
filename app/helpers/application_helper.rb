# -*- encoding : utf-8 -*-
module ApplicationHelper
  # options:  must give the :coordinates and :title
  def point_area(options = {} )
    options = options.reverse_merge(:radius => 10)
    point_id = options[:point_id]

    acupuncture_point = get_acupuncture_point :point_name => options[:title], :point_id => options[:point_id]
    raw %Q{
<area coords='#{options[:coordinates]},#{options[:radius]}'
  data-maphilight='{"strokeColor":"ff0000","strokeWidth":4,"fillColor":"9966ff","fillOpacity":0.0}'
  href='#'
  onclick='add_to_list(this);return false'
  point_id="#{point_id}"
  point_position="#{acupuncture_point.try(:position)}"
  point_name="#{acupuncture_point.try :name}"
  shape='circle'
  title="#{options[:title]}" />
    }
  end
  private
  def get_acupuncture_point options
    if options[:point_id].present?
      result = AcupuncturePoint.find(options[:point_id])
    elsif options[:point_name].present?
      result = AcupuncturePoint.where("name like ?", "#{options[:point_name]}%").first
    else
      result = AcupuncturePoint.new(:position => "new position", :name => "unknown name")
    end
    return result
  end
end
