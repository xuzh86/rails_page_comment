module RailsPageComment
  # Handle the load and authorization controller logic so we don't clutter up all controllers with non-interface methods.
  # This class is used internally, so you do not need to call methods directly on it.
  class ControllerResource # :nodoc:

    ActionView::Base.send(:include, RailsPageComment::Engine.routes.url_helpers) # brings ActionDispatch::Routing::UrlFor
    ActionView::Base.send(:include, ActionView::Helpers::TagHelper)
    ActionView::Base.send(:include, ActiveSupport::Configurable)
    ActionView::Base.send(:include, ActionController::RequestForgeryProtection)

    def self.add_after_filter(controller_class, method, *args)
      if  RailsPageComment.show_on_page
        options = args.extract_options!
        resource_name = args.first
        before_filter_method = options.delete(:prepend) ? :prepend_after_filter : :after_filter
        controller_class.send(before_filter_method, options.slice(:only, :except, :if, :unless)) do |controller|
          controller.class.page_comment_resource_class.new(controller, resource_name, options.except(:only, :except, :if, :unless)).send(method)
        end
      end
    end

    def initialize(controller, *args)
      @controller = controller
      @params = controller.params
      @options = args.extract_options!
      @name = args.first
    end

    def page_comment_resource
      if !@controller.request.xhr?
        page_controller = RailsPageComment::PageCommentsController.new
        page_controller.request = @controller.request
        av = ActionView::Base.new(File.join(Gem.loaded_specs['rails_page_comment'].full_gem_path, 'app', 'views', 'rails_page_comment', 'page_comments'), {}, )
        page_uri = [@controller.params[:controller], @controller.params[:action]].join("/")
        page_comment = RailsPageComment::PageComment.find_by(:page_uri => page_uri) || RailsPageComment::PageComment.new(:page_uri => page_uri)
        av.assign({
                      :page_comment => page_comment,
                      :_csrf_token => @controller.session[:_csrf_token]
                  })
        if page_comment.new_record?
          html = av.render(:template => "new")
        else
          html = av.render(:template => "edit")
        end

        @controller.response.body = @controller.response.body.gsub('</body>',"#{html}</body>")
      end
    end


  end
end
