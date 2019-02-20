class AskcommentController < ApplicationController
    def create
    @ask = Ask.find(params[:ask_id])
    @askcomment = @ask.askcomments.new
    @askcomment.askcomment = params[:askcomment]
    @askcomment.user_id = params[:user_id]
    @askcomment.save
    
    redirect_to @ask

    end
end
