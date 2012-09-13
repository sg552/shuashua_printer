module ApplicationHelper
  # options:  must give the :coordinates and :title
  def point_area(options = {} )
    options = options.reverse_merge(:radius => 10)

    acupuncture_point = AcupuncturePoint.exists?(options[:point_id]) ?
      AcupuncturePoint.find(options[:point_id]) :
      AcupuncturePoint.new(:position => "new position", :name => "unknown name")
    raw %Q{
<area coords='#{options[:coordinates]},#{options[:radius]}'
  data-maphilight='{"strokeColor":"ff0000","strokeWidth":4,"fillColor":"9966ff","fillOpacity":0.0}'
  href='#'
  onclick='add_to_list(this);return false'
  point_id="#{options[:point_id]}"
  point_position="#{acupuncture_point.position}"
  point_name="#{acupuncture_point.name}"
  shape='circle'
  title="#{options[:title]}" />
    }
  end
end
