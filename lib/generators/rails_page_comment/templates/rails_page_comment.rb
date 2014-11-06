# Use this hook to configure RailsPageComment
RailsPageComment.setup do |config|

  # show comment on page or not
  config.show_on_page = true

  config.notify_changes_class_name  = "RailsPageComment::NotifyChanges"

  # After Changed send email's recipients
  config.recipient_email = ["to@example.com"]

  # After Changed send email from
  config.email_from = ["from@example.com"]

  # text_area size cols, default: 90
  # config.text_area_cols = 90
  # config.text_area_rows = 20


end
