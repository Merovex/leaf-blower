module ApplicationHelper

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
  def keep(word,t=4)
    # raise (User.roles.keys[1..3]).inspect
    return word if !current_user.nil? and User.roles.keys[1..3].include?(current_user.role)
    return word.truncate(t+3)
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
      when n >= (total + 4) then
        return "<span class='bg-primary' style='padding: 2px'><abbr title='#{n}/#{total} leaves'><strong>Star</strong></abbr></span>".html_safe;
      when n >= total then
        return "<span class='bg-primary' style='padding: 2px'><abbr title='#{n}/#{total} leaves'><strong>B + #{n - total}</strong></abbr></span>".html_safe;
      else
        return "<span><abbr title='#{(n.to_f / total.to_f * 100.0).to_i} %'><strong>#{n}</strong><small class='text-muted'>/#{total}</small></abbr></span>".html_safe;
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
