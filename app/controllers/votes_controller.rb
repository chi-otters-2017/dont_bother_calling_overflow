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
  p params
  @vote = Vote.new({
    user_id: session[:id],
    voteable_type: params[:voteable_type],
    voteable_id: params[:voteable_id],
    upvote: params[:vote_id]
    })
  if @vote.save
    p "I saved"
    p @vote
    redirect "/"
  else
    p "I'm busted"
    redirect "/"
  end
end
