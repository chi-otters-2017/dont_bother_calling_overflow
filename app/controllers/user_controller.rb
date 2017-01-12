post "/users" do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/questions"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

get "/users/new" do
  erb :"/users/new"
end
