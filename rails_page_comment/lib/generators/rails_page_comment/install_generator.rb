require 'rails/generators'
require 'rails/generators/migration'

module RailsPageComment
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      desc "Generates migration for Page Comment (RailsPageComment) models"

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def self.next_migration_number(dirname)
        Time.now.strftime("%Y%m%d%H%M%S")
      end

      # copy configuration
      def copy_initializer
        template "rails_page_comment.rb", "config/initializers/rails_page_comment.rb"
      end

      def mount_engine
        route "mount RailsPageComment::Engine => '/rails_page_comment'"
      end

      # def create_models
      #   [:page_comment].each do |filename|
      #     template "#{generator_dir}/rails_page_comment/#{filename}.rb",
      #              File.join('app/models', rails_page_comment_dir, "#{filename}.rb")
      #   end
      # end
      #
      def create_migrations
          migration_template "#{generator_dir}/migration.rb", File.join('db/migrate', "create_rails_page_comment_page_comments.rb")
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
