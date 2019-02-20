class CommCommentController < ApplicationController
  def create
    comment = CommComment.new
    comment.article_id = params[:id]
    comment.message = params[:comment]
    comment.user = params[:user]
    comment.save
    redirect_to "/communities/#{comment.article_id}"
  end

  def delete
    #@pension = Pension.find(params[:pension_id])
    @community = Community.find(params[:article_id])
    comment = CommComment.find(params[:id])
    comment.delete
    redirect_to "/communities/#{@community.id}"
    end
end