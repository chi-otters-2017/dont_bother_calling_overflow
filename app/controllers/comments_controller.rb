get "/:commentable_type/:commentable_id/comments/new" do
  if params[:commentable_type] == "questions"
    @commentable_type = "Question"
  elsif params[:commentable_type] == "answers"
    @commentable_type = "Answer"
  end
  @commentable_id = params[:commentable_id]
  erb :"/comments/new"
end

post "/comments" do
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
