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
  def chinese_name(meridian_type)
    case meridian_type
      when 'zusanyin' then '足三阴'
      when 'shousanyin' then '手三阴'
      when 'shousanyang' then '手三阳'
      when 'zusanyang' then '足三阳'
    end
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
    zusanyin = Meridian.where("meridian_type = ?" , 'zusanyin')
    shousanyin = Meridian.where("meridian_type = ?" , 'shousanyin')
    shousanyang = Meridian.where("meridian_type = ?" , 'shousanyang')
    zusanyang = Meridian.where("meridian_type = ?" , 'zusanyang')
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
