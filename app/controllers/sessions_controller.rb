get "/sessions" do
  erb :"/sessions/new"
end

post "/sessions" do
  user = User.find_by({email: params[:session][:email]})
  p user
  p params[:session][:password]
  if User.authenticate(params[:session][:email], params[:session][:password]) != nil
    session[:id]= user.id
    redirect "/questions"
  else
    p "I done fucked up"
    @errors = user.errors.full_messages
    erb :"sessions/new"
  end
end

post "/sessions/:id" do
  sessions[:id] = nil
  redirect "/questions"
end
