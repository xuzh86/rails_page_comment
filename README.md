# Rails Page Comment

By xuzh

## Features

Write comment on the page.

## Installation

For basic usage just include rails_page_comment gem:

```ruby
gem 'rails_page_comment'
```

### How generate config files

`rails generate rails_page_comment:install`

### Setting

To use set it show on the page or not, add this to an initializer.

```ruby
# in config/initializers/rails_page_comment.rb

RailsPageComment.setup do |config|

  # show comment on page or not
  config.show_on_page = true

  # Custom send mail class and methods
  config.notify_changes_class_name  = "RailsPageComment::NotifyChanges"
  config.notify_changes_method_name = [:notice_changes]

  # After Changed send email's recipients
  config.recipient_email = ["to@example.com"]

  # After Changed send email from
  config.email_from = ["from@example.com"]

  # text_area size cols, default: 90
  # config.text_area_cols = 90
  # config.text_area_rows = 20


end
```

### Configuring mailer views

We built RailsPageComment to help you quickly develop an application that uses writing comment and send email. However, we don't want to be in your way when you need to customize it.

Since RailsPageComment is an engine, all its views are packaged inside the gem. These views will help you get started, but after some time you may want to change them. If this is the case, you just need to invoke the following generator, and it will copy a mailer view to your application:

```console
rails generate rails_page_comment:mailer_views
```

##Usage

```ruby
class ApplicationController < ActionController::Base

  page_comment_resource

end
```

This project rocks and uses MIT-LICENSE.
