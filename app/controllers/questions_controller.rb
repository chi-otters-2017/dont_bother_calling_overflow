get '/' do
  redirect '/questions'
end

get '/questions/new' do
  if login_check
	 erb :"questions/new"
  else
    redirect '/'
  end
end

post '/questions' do
   @user = User.find(session[:id])
  @question = Question.new(title: params[:title], body: params[:body], user_id: @user.id)

  if @question.save

    redirect "/questions/#{@question.id}"
  else
  	@errors = @question.errors.full_messages

    erb :'questions/new'
  end
end

get '/questions/:id' do
  if session[:id]
    @user = User.find(session[:id])
  end
	@question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(question_id: @question.id)

  if @question
  	erb :"questions/show"
  else
    redirect '/'
  end

end

get '/questions' do
  @allQuestions = Question.all
  if @allQuestions
    erb :index
  end
end

get '/questions/:question_id/:comment_type/:id/edit' do
  if login_check
    @comment_type = params[:comment_type]
    @user = User.find(session[:id])
    @class_name = Object.const_get(@comment_type)
    @class_obj = @class_name.find(params[:id])
    @question_id = params[:question_id]
    p "@class_obj: #{@class_obj}"
    p "if #{@class_obj.user_id} == #{@user.id}"
    if @class_obj.user_id == @user.id
      erb :edit
    else
      redirect '/'
    end
  else
    redirect '/'
  end
end

put '/:comment_type/:id' do
  @comment_type = params[:comment_type]
  @class_name = Object.const_get(@comment_type)
  @class_obj = @class_name.find(params[:id])
  if request.xhr?
    p "SERVER SIDE SAYS HI"
    p params
    if @class_obj.update_attributes(body: params[:body_text])
      @class_obj.body
      # ???????????????????????
    end
  else
    if @class_obj.update_attributes(body: params[:body_text])
      redirect "/questions/#{params[:question_id]}"
    else
      @errors = @class_obj.errors.full_messages
      erb :edit
    end
  end
end


