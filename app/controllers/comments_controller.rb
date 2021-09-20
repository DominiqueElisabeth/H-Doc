class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
   before_action :set_post

   def index
     @comments = @post.comments.order("created_at")
   end

   def new
     @comment = @post.comments.new
   end

   def show
   end

   def create
     @comment = @post.comments.new(comment_params)
     @comment.update(doctor_id: current_doctor.id)
     if @comment.save
       redirect_to @post
     else
       render :new
     end
   end

   def edit
   end

   def update
     @comment = Comment.find(params[:id])
     if @comment.update(comment_params)
       redirect_to @post
     else
       render :edit
     end
   end

   def destroy
     @comment.destroy
     redirect_to @post
   end

    private

     def set_comment
       @comment = Comment.find(params[:id])
     end

     def set_post
       @post = Post.find(params[:post_id])
     end

 # Strong parameters
 def comment_params
   params.require(:comment).permit(:post_id, :content, :doctor_id)
 end
end
