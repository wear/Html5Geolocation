# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper        
  
  def make_score(score)
     new_score = ((score.to_f/6)*10).round.to_f/10
     new_score > 5.0 ? 5.0 : new_score
  end
  
  def star(vendor)
    total = vendor.sum 
    case total
    when 10..14
      "onestar"
    when 14..20
      "twostar"
    when 20..24
      "threestar"
    when 24..28
      "fourstar"
    when 28..100
      "fivestar"
    end                 
  end
  
  def notice(step,page)
    return 'highlight' if step == page
  end                 
  
  def state_type(type)
    (type == 'error') ? 'error' : 'highlight'
  end  
  
  
end
