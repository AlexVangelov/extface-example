module ApplicationHelper
  def bootstrap_class_for flash_type
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
  
  def form_group(f, field, control, options = {})
    content_tag(:div, class: 'form-group') do
      f.label(field, class: 'col-sm-2 control-label') +
      content_tag(:div, class: 'col-sm-10 col-md-8') do
        f.send(control, field, options.merge( class: "form-control #{options[:class]}"))
      end
    end
  end
  
  def modal_form_group(f, field, control, options = {})
    content_tag(:div, class: 'form-group') do
      f.label(field, class: 'col-sm-4 control-label') +
      content_tag(:div, class: 'col-sm-8') do
        f.send(control, field, options.merge( class: "form-control #{options[:class]}"))
      end
    end
  end
  
  def blank_modal(id, css_class = nil, autoreloaded = false)
    content_tag :div, id: id, class: 'modal fade', data: { autoreloaded: autoreloaded } do
      content_tag :div, class: "modal-dialog #{css_class}" do
        content_tag :div, class: 'modal-content' do
          content_tag :div, align: :center, class: 'modal-header' do
            content_tag(:h4, class: 'modal-title') do
              button_tag( '&times;'.html_safe, type: :button, class: :close, data: { dismiss: :modal } ) + content_tag(:i, nil, class: 'fa fa-spinner fa-spin fa-2x')
            end
          end
        end
      end
    end
  end
end
