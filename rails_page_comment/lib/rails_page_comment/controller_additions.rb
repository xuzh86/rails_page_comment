module RailsPageComment

  # This module is automatically included into all controllers.
  module ControllerAdditions
    module ClassMethods
      # Sets up a before filter which loads and authorizes the current resource. This performs both
      #
      #   class BooksController < ApplicationController
      #     page_comment_resource
      #   end
      #
      def page_comment_resource(*args)
        page_comment_resource_class.add_after_filter(self, :page_comment_resource, *args)
      end

      def page_comment_resource_class
        ControllerResource
      end


    end

    def self.included(base)
      base.extend ClassMethods
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include RailsPageComment::ControllerAdditions
  end
end
