# Rails Page Comment

By xuzh

## Features

Write comment on the page.

## Installation

For basic usage just include ckeditor gem:

```ruby
gem 'rails_page_comment'
```


### How generate config files


`rails generate rails_page_comment:install`


To use set it show on the page or not, add this to an initializer.

```ruby
# in config/initializers/rails_page_comment.rb

Ckeditor.setup do |config|
  config.show_on_page = true/false
end
```
##Usage

```ruby
class ApplicationController < ActionController::Base

  page_comment_resource

end
```

This project rocks and uses MIT-LICENSE.