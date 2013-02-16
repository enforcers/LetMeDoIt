class DatePickerInput < SimpleForm::Inputs::StringInput 
  def input                    
    value = object.send(attribute_name) if object.respond_to? attribute_name
    if value.present?
    	input_html_options[:value] ||= I18n.localize(value)
    else
    	input_html_options[:value] = Date.today.to_s
    end
    input_html_options[:readonly] = "readonly"
    input_html_options[:type] = "text"

    template.content_tag(:div,
    	super +
    	template.content_tag(:div, template.content_tag(:i, nil, :class => "icon-calendar"), :class => "add-on"),
    	:class => "input-append date",
    	:'data-date-format' => "yyyy-mm-dd",
    	:'data-date' => input_html_options[:value]
    )
    #super # leave StringInput do the real rendering
  end
end