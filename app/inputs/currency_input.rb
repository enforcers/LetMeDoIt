class CurrencyInput < SimpleForm::Inputs::StringInput
  def input
  	input_html_options[:type] = "text"

    template.content_tag(:div,
    	template.content_tag(:div, template.content_tag(:i, "&euro;".html_safe), :class => "add-on") +
    	super,
    	:class => "input-prepend",
    )
  end
end