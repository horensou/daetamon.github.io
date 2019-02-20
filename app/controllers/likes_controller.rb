class LikesController < ApplicationController
    def like_toggle
    like = Like.find_by(user: current_user, community_id: params[:id])
    if like.nil?
        Like.create!(user: current_user, community_id: params[:id])
    else
        like.destroy
        
    end
    redirect_to community_url params[:id]
        
    end
    
end