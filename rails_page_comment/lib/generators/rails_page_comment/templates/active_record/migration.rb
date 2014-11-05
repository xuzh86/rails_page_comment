class CreateRailsPageCommentPageComments < ActiveRecord::Migration
  def self.up
    create_table :rails_page_comment_page_comments do |t|
      t.string  :page_uri, :null => false

      t.text :content
      t.timestamps
    end

    add_index "rails_page_comment_page_comments", ["page_uri"], :name => "idx_rails_page_comment_page_comments_page_uri"
  end

  def self.down
    drop_table :rails_page_comment_page_comments
  end
end
