require "rails_page_comment/version"
require 'rails_page_comment/engine'
require 'rails_page_comment/controller_resource'
require 'rails_page_comment/controller_additions'

module RailsPageComment
  # Your code goes here...
  mattr_accessor :show_on_page
  @@show_on_page = true

  mattr_accessor :notify_changes_class_name
  @@notify_changes_class_name  = "RailsPageComment::NotifyChanges"

  mattr_accessor  :notify_changes_method_name
  @@notify_changes_method_name = [:notice_changes]

  mattr_accessor :recipient_email
  @@recipient_email = []

  mattr_accessor :email_from
  @@recipient_email = ""

  mattr_accessor :text_area_cols
  @@text_area_cols = 90

  mattr_accessor :text_area_rows
  @@text_area_rows = 20

  module Helpers

  end


  def self.setup
    yield self
  end

end
