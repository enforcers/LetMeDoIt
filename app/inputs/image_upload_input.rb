class ImageUploadInput < SimpleForm::Inputs::FileInput 
  def input                    
    value = object.send(attribute_name) if object.respond_to? attribute_name
    d_class = (value.present?) ? "fileupload-exists" : "fileupload-new"

    template.content_tag(:div,
        template.content_tag(:div,
            template.image_tag("http://placehold.it/50x50/EFEFEF/AAAAAA"),
            :class => "fileupload-new thumbnail"
        ) +
        template.content_tag(:div,
            template.image_tag(value),
            :class => "fileupload-preview fileupload-exists thumbnail"
        ) +
        template.content_tag(:span,
            template.content_tag(:span, "Select Image", :class => "fileupload-new") +
            template.content_tag(:span, "Change", :class => "fileupload-exists") +
            super,
            :class => "btn btn-file"
        ) +
        template.link_to("Remove", "#", :class => "btn fileupload-exists", :'data-dismiss' => "fileupload"),
        :class => "fileupload #{d_class}",
        :'data-provides' => "fileupload"
    )
  end
end