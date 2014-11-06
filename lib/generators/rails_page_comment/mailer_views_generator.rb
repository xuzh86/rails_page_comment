require 'rails/generators'
require 'rails/generators/migration'

module RailsPageComment
  module Generators
    class MailerViewsGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generates migration for Page Comment (RailsPageComment) mailer views"

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      # copy configuration
      def copy_views
        template "mailer/notice_changes.html.erb", "app/views/#{rails_page_comment_dir}/notify_changes/notice_changes.html.erb"
      end

      protected

        def rails_page_comment_dir
          'rails_page_comment'
        end

        def generator_dir
          @generator_dir ||= 'active_record'
        end

    end
  end
end
