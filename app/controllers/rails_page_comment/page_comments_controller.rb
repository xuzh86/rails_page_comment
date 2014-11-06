require_dependency "rails_page_comment/application_controller"

module RailsPageComment
  class PageCommentsController < ApplicationController
    before_action :set_page_comment, only: [:show, :edit, :update, :destroy]

    # GET /page_comments
    def index
      @page_comments = PageComment.all
    end

    # GET /page_comments/1
    def show
    end

    # GET /page_comments/new
    def new
      @page_comment = PageComment.new
    end

    # GET /page_comments/1/edit
    def edit
    end

    # POST /page_comments
    def create
      @page_comment = PageComment.new(create_page_comment_params)
      if @page_comment.save
        render :edit
      else
        render :nothing  => true
      end
    end

    # PATCH/PUT /page_comments/1
    def update
      if @page_comment.update(update_page_comment_params)
        render :edit
      else
        render :edit
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_page_comment
        @page_comment = PageComment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def create_page_comment_params
        params.require(:page_comment).permit(:content, :page_uri)
      end

      # Only allow a trusted parameter "white list" through.
      def update_page_comment_params
        params.require(:page_comment).permit(:content)
      end

  end
end
