get '/' do
  redirect '/questions'
end

get '/questions/new' do

	erb :"/questions/new"
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
  	erb :"/questions/show"
  else
    redirect '/'
  end

end

get '/questions' do
  @allQuestions = Question.all
  p @allQuestions
  if @allQuestions
    erb :index
  end
end
