get "/sessions" do
  erb :"/sessions/new"
end

post "/sessions" do

  user = User.find_by({email: params[:session][:email]})
  if User.authenticate(params[:session][:email], params[:session][:password]) != nil
    session[:id]= user.id
    if request.xhr?
      erb :"/users/debug"
    else
     redirect "/"
    end
  else
    @errors = user.errors.full_messages
    erb :"sessions/new"
  end
end

delete "/sessions" do
  session[:id] = nil
  redirect "/questions"
end
