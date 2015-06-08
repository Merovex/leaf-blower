module ApplicationHelper

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  def subdue_zero(n)
    total = 18
    case 
      when n.to_s == '0' then
        return "<span class='text-muted'>0<small>/#{total}</small></span>".html_safe
      when n >= total then
        x = ((n - total) / 4).floor
        # return "<span class='bg-danger' style='padding: 2px'><abbr title='#{n} /#{total} leaves'><strong>#{x}</strong> star#{x==1 ? '' : 's'}</abbr></span>".html_safe;
        return "<span class='bg-success' style='padding: 2px'><abbr title='#{n}/#{total} leaves'><strong>B + #{x}</strong></abbr></span>".html_safe;
      when n < total
        return "<span><abbr title='#{(n.to_f / total.to_f * 100.0).to_i} %'><strong>#{n}</strong><small class='text-muted'>/#{total}</small></abbr></span>".html_safe;
      else
        return "<span class='bg-success' style='padding: 2px'><abbr title='#{n}/#{total} leaves'><strong>Br + 0</strong></abbr></span>".html_safe;
    end
    
  end
  def title(t)
    return "<h1>#{t.titlecase}</h1>".html_safe
  end
  def subtitle(s)
    "<div class='subtitle'>#{s.titlecase}</div>".html_safe
  end
  def show_map(location)
    return "" if location.nil?
    html = image_tag "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{location.latitude}%2C#{location.longitude}" 
    html += p location.address
    return "<div>#{html}</div>".html_safe
  end

end
