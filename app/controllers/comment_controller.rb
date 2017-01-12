get "/:commentable_type/:commentable_id/comments/new" do
  @commentable_type = params[:commentable_type]
  @commentable_id = params[:commentable_id]
  erb :"/comments/new"
end

post "/:commentable_type/:commentable_id/comments" do
  @comment = Comment.new({commentable_type: params[:commentable_type],
                          commentable_id: params[:commentable_id],
                          body: params[:body],
                          user_id: session[:id]})
  if @comment.save
    redirect "/#{params[:commentable_type]}/#{params[:commentable_id]}"
  else
    @errors = @comment.errors.full_messages
    erb :"/comments/new"
  end
end
