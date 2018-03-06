class ActivitiesController < ApplicationController
    before_action :authenticate_user!,  only: [:index]
    
    def index
       @user =  current_user.active_friends
       @user.push(current_user)
       case params[:content] when 'posts'
            @activities = PublicActivity::Activity.where(owner_id: @user, trackable_type: "Post").order('created_at DESC')
       else
           @activities = PublicActivity::Activity.where(owner_id: @user).order('created_at DESC')
       end    
    end    
    
    
    
end