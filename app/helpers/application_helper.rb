module ApplicationHelper

  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-danger"
          when :alert then "alert alert-danger"
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
  def subdue_zero(r,branch)
    total = 18
    total = 9

    key = branch_to_track(branch)

    accrued_on = r.public_send("#{key}_on".to_sym)
    ttd_on = r.public_send("#{key}_tt_on".to_sym)

    n = r.public_send(branch.to_sym)
    bang = ""
    klass = 'info'
    
    if (!accrued_on.blank? and (ttd_on.blank? or ttd_on.nil?))
      bang = "!" 
      klass = 'primary'
    end

    answer = case 
      when n.to_s == '0' then
        "<span class='text-muted'>0<small>/#{total}</small></span>";
      when n >= (total + 4) and r.starable? then
      # when n >= (total + 9) then
        "<strong class='bg-#{klass}' style='padding: 2px'><abbr title='#{n}/#{total} leaves'>Star</abbr></strong>";
      when n >= total then
        "<strong class='bg-#{klass}' style='padding: 2px'><abbr title='#{n}/#{total} leaves'>B+#{n - total}</abbr>#{bang}</strong>";
      else
        "<span><abbr title='#{(n.to_f / total.to_f * 100.0).to_i} %'><strong>#{n}</strong><small class='text-muted'>/#{total}</small></abbr></span>";
    end
    answer = "<a href='#{boy_path(r.boy)}'>#{answer}</a>" if (!accrued_on.blank? and ttd_on.blank?)
    return answer.html_safe
    
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
