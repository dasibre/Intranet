module ApplicationHelper
	def full_title(page_title)
		base_title = "Intranet"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	def no_val(field_value=nil)
		if field_value.blank?
			return content_tag('em','not specified')
		else
			return field_value
		end
	end

	def human_date(date)
		if date.nil?
		   nil
		else
			date.strftime("%d %B %Y")
		end
	end
end
