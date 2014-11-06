$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_page_comment/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_page_comment"
  s.version     = RailsPageComment::VERSION
  s.authors     = ["xuzh"]
  s.email       = ["xuzh86@gmail.com"]
  s.homepage    = "https://github.com/xuzh86/rails_page_comment"
  s.summary     = "Comment Rails Page."
  s.description = "Comment Rails Page. Send email when page's comment changed."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.2"
end
