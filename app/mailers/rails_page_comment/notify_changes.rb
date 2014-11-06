module RailsPageComment
  class NotifyChanges < ActionMailer::Base


    default from: "from@example.com"


    def notice_changes(page_comment)
      @page_comment = page_comment
      mail(to: RailsPageComment.recipient_email,
           subject: "画面／機能の詳細仕様を変更しました。", from: RailsPageComment.email_from)
    end

  end
end
