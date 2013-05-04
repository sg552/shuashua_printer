# -*- encoding : utf-8 -*-
module ApplicationHelper
  # options:  must give the :coordinates and :title
  def point_area(options = {} )
    options = options.reverse_merge(:radius => 10)
    point_id = options[:point_id]
    acupuncture_point = get_acupuncture_point :point_name => options[:title], :point_id => options[:point_id]
    point_id  = acupuncture_point.id if point_id.blank?
    meridian_type = get_meridian_type(acupuncture_point)
    raw %Q{
<area coords='#{options[:coordinates]},#{options[:radius]}'
  data-maphilight='{"strokeColor":"ff0000","strokeWidth":4,"fillColor":"9966ff","fillOpacity":0.0}'
  href='#'
  onclick='add_to_list(this,"#{meridian_type}");return false'
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
  def get_meridian_type acupuncture_point
    zusanyin = Meridian.where("name like ? or name like ? or name like ?" , "%肝经%", "%脾经%", "%肾经%")
    shousanyin = Meridian.where("name like ? or name like ? or name like ?" , "%心包经%", "%肺经%", "%心经%")
    shousanyang = Meridian.where("name like ? or name like ? or name like ?" , "%大肠经%", "%三焦经%", "%小肠经%")
    zusanyang = Meridian.where("name like ? or name like ? or name like ?" , "%胃经%", "%胆经%", "%膀胱经%")
    meridian_id = acupuncture_point.try(:meridian).try(:id).try(:to_i)
    meridian_type = case
      when meridian_id.in?(zusanyin.map(&:id)) then 'zusanyin'
      when meridian_id.in?(shousanyin.map(&:id)) then 'shousanyin'
      when meridian_id.in?(shousanyang.map(&:id)) then 'shousanyang'
      when meridian_id.in?(zusanyang.map(&:id)) then 'zusanyang'
      else 'unknow'
    end
    return meridian_type
  end
end
