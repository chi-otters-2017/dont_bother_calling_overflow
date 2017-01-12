get "/sessions" do
  erb :"/sessions/new"
end

post "/sessions" do
  user = User.find_by({email: params[:session][:email]})
  if User.authenticate(params[:session][:email], params[:session][:password]) != nil
    session[:id]= user.id
    redirect "/questions"
  else
    @errors = user.errors.full_messages
    erb :"sessions/new"
  end
end

delete "/sessions" do
  sessions[:id] = nil
  redirect "/questions"
end
