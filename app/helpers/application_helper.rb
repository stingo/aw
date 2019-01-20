module ApplicationHelper


    def flash_class(level)
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end



def resource_name
:user
end

def resource
@resource ||= User.new
end

def devise_mapping
@devise_mapping ||= Devise.mappings[:user]
end




  def country_name
    country = self.country
    ISO3166::Country[country]
   end

#helper for ancestry - nested tree
	def nested_dropdown(ws)
    result = []
    ws.map do |w, sub_ws|
        result << [('- ' * w.depth) + w.name, w.id]
        result += nested_dropdown(sub_ws) unless sub_ws.blank?
    end
    result
end



end

def nested_updropdown(ws)
    s = content_tag(:ul) do
       ws.map do |w, sub_ws|
        content_tag(:li, (w.name +  nested_updropdown(sub_ws)).html_safe)
      end.join.html_safe
    end
  end
