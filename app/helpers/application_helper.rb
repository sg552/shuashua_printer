module ApplicationHelper
  # options:  must give the :coordinates and :title
  def point_area(options = {} )
    options = options.reverse_merge(:radius => 10)
    raw %Q{
<area coords='#{options[:coordinates]},#{options[:radius]}'
  data-maphilight='{"strokeColor":"ff0000","strokeWidth":4,"fillColor":"9966ff","fillOpacity":0.0}'
  href='#'
  onclick='add_to_list(#{options[:point_id]});return false'
  shape='circle'
  title="#{options[:title]}" />
    }
  end
end
