module Sal
  module ApplicationHelper
    def errors_bar(*entities)
      entities = Array(entities)

      messages = entities.map { |entity| entity.errors[:base].map &:capitalize }.flatten

      # is there any non-base error?
      if entities.detect { |entity| entity.errors.keys.detect { |error| error != :base } }
        messages << t(:errors_bar_message)
      end

      if messages.any?
        content_tag :div, messages.join("\n"), class: 'alert alert-danger'
      end
    end

    def messages_bar
      if notice
        content_tag :div, notice.html_safe, class: 'alert alert-success'
      elsif alert
        content_tag :div, alert.html_safe, class: 'alert alert-warning'
      end
    end

    def menu_item(item, options = {})
      tag = options.delete(:tag) || 'li'
      if section == item
        klass = options[:class].to_s.split(' ').push('active').join(' ')
        options[:class] = klass
      end
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
