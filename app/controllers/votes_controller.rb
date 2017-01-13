get "/:voteable_type/:voteable_id/votes/new" do
  if params[:voteable_type] == "questions"
    @voteable_type = "Question"
  elsif params[:voteable_type] == "answers"
    @voteable_type = "Answer"
  elsif params[:voteable_type] == "comments"
    @voteable_type = "Comment"
  end
  @voteable_id = params[:voteable_id]
  erb :"/votes/new"
end

post "/votes" do
  @vote = Vote.new({
    user_id: session[:id],
    voteable_type: params[:voteable_type],
    voteable_id: params[:voteable_id],
    upvote: params[:vote_id]
    })
  if @vote.save

    redirect "/"
  else
   
    redirect "/"
  end
end
