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

	# adds * to required fields
	def form_label(model, label_text, options={})
		field_name = options[:field_name]
		field_name ||= label_text.gsub(' ', '_')
		label_for = (model.to_s + '_' + field_name).downcase
		label_tag = content_tag('label', label_text, label_for)
		label_tag += '*' if options[:required]
		#label_tag += ':'
		content_tag('strong', label_tag)
	end

	def dob(object_name, method, options={})
		date = Time.now.year
		this_date = date_select(object_name,method, :order => [:month, :day, :year], :end_year => (date - 100), :start_year => (date), :include_blank => true)
	end
end
