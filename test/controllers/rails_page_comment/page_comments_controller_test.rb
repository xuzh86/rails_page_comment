require 'test_helper'

module RailsPageComment
  class PageCommentsControllerTest < ActionController::TestCase
    setup do
      @page_comment = page_comments(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:page_comments)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create page_comment" do
      assert_difference('PageComment.count') do
        post :create, page_comment: { content: @page_comment.content, requst_uri: @page_comment.requst_uri }
      end

      assert_redirected_to page_comment_path(assigns(:page_comment))
    end

    test "should show page_comment" do
      get :show, id: @page_comment
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @page_comment
      assert_response :success
    end

    test "should update page_comment" do
      patch :update, id: @page_comment, page_comment: { content: @page_comment.content, requst_uri: @page_comment.requst_uri }
      assert_redirected_to page_comment_path(assigns(:page_comment))
    end

    test "should destroy page_comment" do
      assert_difference('PageComment.count', -1) do
        delete :destroy, id: @page_comment
      end

      assert_redirected_to page_comments_path
    end
  end
end
