module FormHelper
  ActionView::Helpers::FormBuilder.class_eval do
    def bootstrap_text_field(label, *args)
      options = args.extract_options!
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.text_field(@object_name, label, *args)
        end
        )
      end
    end

    def bootstrap_text_area(label, *args)
      options = args.extract_options!
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.text_area(@object_name, label, *args)
        end
        )
      end
    end

    def bootstrap_password_field(label, *args)
      options = args.extract_options!
      options = options.merge(:autocomplete => "off")
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.password_field(@object_name, label, *args)
        end
        )
      end
    end

    def bootstrap_email_field(label, *args)
      options = args.extract_options!
      options = options.merge(:autocomplete => "off")
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.email_field(@object_name, label, *args)
        end
        )
      end
    end

    def bootstrap_check_box(label, *args)
      options = args.extract_options!
      options = options.merge(:autocomplete => "off")
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag :div, :class => "controls" do
          @template.content_tag(:label,
                                :for => "#{@object_name}_#{label}",
                                :class => "checkbox") do
            @template.check_box(@object_name, label, *args) +
            label.to_s.humanize
          end
        end
      end
    end

    def bootstrap_date_field(label, date, *args)
      options = args.extract_options!
      args << options.merge(:class => "input-append date", :id => "dp", :data => {:date => date, :'date-format' => "yyyy-mm-dd"})

      @template.content_tag :div, :class => "control-group" do
        (@template.javascript_tag do
          %{
            $(function(){
              $('#dp').datepicker()
            });
          }
        end) +
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.content_tag(:div, *args) do
            @template.text_field(@object_name, label, :class => "span2", :readonly => "readonly") +
            (@template.content_tag :div, :class => "add-on" do
              @template.content_tag :i, nil, :class => "icon-calendar"
            end)
          end
        end
        )
      end
    end

    def bootstrap_money_field(label, *args)
      options = args.extract_options!
      options = options.merge(:autocomplete => "off")
      if !options.has_key?(:class)
        args << options.merge(:class => "input-xxlarge")
      else
        args << options
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.content_tag :div, :class => "input-prepend" do
            (@template.content_tag :span, "&euro;".html_safe, :class => "add-on") +
            (@template.text_field(@object_name, label, *args))
          end
        end
        )
      end
    end

    def bootstrap_element(label, element)
      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          element
        end
        )
      end
    end

    def bootstrap_file_upload(label, preview = nil)
      if @object.send(label).nil?
        d_class = "fileupload-new"
      else
        d_class = "fileupload-exists"
      end

      @template.content_tag :div, :class => "control-group" do
        @template.content_tag(:label,
                              label.to_s.humanize,
                              :for => "#{@object_name}_#{label}",
                              :class => "control-label") +
        (
        @template.content_tag :div, :class => "controls" do
          @template.content_tag :div, :class => "fileupload #{d_class}", :'data-provides' => "fileupload" do
            (@template.content_tag :div, :class => "fileupload-new thumbnail" do
              @template.image_tag "http://placehold.it/50x50/EFEFEF/AAAAAA"
            end) +
            (@template.content_tag :div, :class => "fileupload-preview fileupload-exists thumbnail" do
              @template.image_tag preview
            end) +
            (@template.content_tag :span, :class => "btn btn-file" do
              (@template.content_tag :span, "Select Image", :class => "fileupload-new") +
              (@template.content_tag :span, "Change", :class => "fileupload-exists") +
              (@template.file_field @object_name, label)
            end) +
            (@template.link_to "Remove", "#", :class => "btn fileupload-exists", :'data-dismiss' => "fileupload")
          end
        end
        )
      end
    end
  end
end