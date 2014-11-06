class CreateRailsPageCommentPageComments < ActiveRecord::Migration
  def change
    create_table :rails_page_comment_page_comments do |t|
      t.string :page_uri
      t.text :content

      t.timestamps
    end
  end
end
