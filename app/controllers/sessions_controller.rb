get "/sessions/new" do
  erb :"/sessions/new"
end

post "/sessions" do

  user = User.find_by({email: params[:session][:email]})
  if User.authenticate(params[:session][:email], params[:session][:password]) != nil
    session[:id]= user.id
    if request.xhr?
      redirect "/users/#{user.id}"
    else
     redirect "/"
    end
  else
    @errors = ["Incorrect Password"]
    erb :"/sessions/new"
  end
end

delete "/sessions" do
  session[:id] = nil
  redirect "/questions"
end
