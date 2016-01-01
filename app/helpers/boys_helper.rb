module BoysHelper
  def show_leaves(i)
    i ||= 10
    return "#{["*"] * i * ' '}".html_safe
  end
  def show_tt_status(boy,key)
    accrued_on = boy.current_rank.public_send("#{key}_on".to_sym)
    ttd_on = boy.current_rank.public_send("#{key}_tt_on".to_sym)
    case 
      when accrued_on.blank?
        return ""
      when (ttd_on.blank? or ttd_on < accrued_on)
        return "" unless can? :record, Rank
        return raw("<a href='/boys/#{boy.id}/record/#{key}' class='btn btn-primary'>Record!</a>")
      else
        return accrued_on.strftime("%e %b '%y")
    end
  end
  def show_date(date)
    return "" if date.blank?
    return date.strftime("%e %b '%y")
  end
  def show_tt_by(u)
    return "" if u.nil?
    return User.find(u).name
  end
  def show_award_bang(r,key)
    accrued_on = r.public_send("#{key}_on".to_sym)
    ttd_on = r.public_send("#{key}_tt_on".to_sym)
    # return "" unless (accrued_on.blank? and !y.blank?)
    return "" if accrued_on.blank?
    return "" unless ttd_on.blank?
    return "<strong class='bg-primary' style='padding: 2px'>!</strong>"
  end
  def branch_to_track(k)
    return { 'heritage' => "heritage",
      'hobbies' => "hobbies",
      'life_skills' => "life",
      'outdoor_activities' => "outdoor",
      'pioneer_skills' => "pioneer",
      'sci_tech' => "science",
      'values' => "values"
    }[k]
end
end
