require "rails_page_comment/version"
require 'rails_page_comment/engine'
require 'rails_page_comment/controller_resource'
require 'rails_page_comment/controller_additions'

module RailsPageComment
  # Your code goes here...
  mattr_accessor :show_on_page
  @@show_on_page = true

  module Helpers

  end


  def self.setup
    yield self
  end

end
