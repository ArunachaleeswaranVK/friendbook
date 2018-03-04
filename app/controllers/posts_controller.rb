class PostsController < ApplicationController
    
    before_action :set_post, only: [:edit,:destroy,:update]
    before_action :authenticate_user!
    
    def create
       @post = current_user.posts.new(post_params)
        if @post.save
            @post.create_activity key: 'post.created', owner: @post.user
           respond_to do |format|
               format.html {redirect_to user_path(@post.user.username) , notice: "Post Created" }
            end 
        else
            redirect_to user_path(@post.user.username), notice: "Error"
        end    
            
    end 
    
    def edit
        
    end  
    
    def update
        if @post.update
           respond_to do |format|
               format.html {redirect_to user_path(@post.user.username) , notice: "Post Updated" }
            end 
        else
            redirect_to post_path(@post), notice: "Error"
        end    
            
    end    
        
    
    def destroy
        @post.destroy
        respond_to do |format|
               format.html {redirect_to user_path(@post.user.username) , notice: "Post Deleted" }
            end
    end   
    
    private
    
    def set_post
       @post = Post.find(params[:id]) 
    end    
    
    def post_params
       params.require(:post).permit(:content) 
    end    
end
