module Sal
  module ApplicationHelper
    def errors_bar(*entities)
      entities = Array(entities)

      if entities.detect { |entity| entity.errors.any? }
        content_tag :div, 'Please correct the highlighted fields.', class: 'alert alert-danger'
      end
    end

    def messages_bar
      if notice
        content_tag :div, notice.html_safe, class: 'alert alert-success'
      elsif alert
        content_tag :div, alert.html_safe, class: 'alert alert-warning'
      end
    end

    def menu_item(item, tag = :li)
      options = section == item ? {class: 'active'} : {}
      content_tag tag, options do
        yield
      end
    end

    def menu_items(set)
      @_set = set
      output = yield
      @_set = :menu
      output
    end

    private

    def section
      set = @_set || :menu
      content_for(set) ? content_for(set).strip.downcase : request.params[:controller]
    end
  end
end
