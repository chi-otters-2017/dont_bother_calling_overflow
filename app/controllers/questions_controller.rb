get '/' do
  redirect '/questions'
end

get '/questions/new' do

	erb :"questions/new"
end

post '/questions' do
  @question = Question.new(params[:question])

  if @question.save

    redirect "/questions/#{@question.id}"
  else
  	@errors = @question.errors.full_messages

    erb :'questions/new'
  end
end

get '/questions/:id' do
	@question = Question.find_by(id: params[:id])
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
  if @class_obj.update_attributes(body: params[:body_text])
    redirect "/questions/#{@class_obj.id}"
  else
    @errors = @class_obj.errors.full_messages
    erb :edit
  end
end


