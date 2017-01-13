get '/' do
  erb :index
end

get '/questions' do
  @allQuestions = Question.all
  p @allQuestions
  if @allQuestions
    erb :index
  end
end

get '/question/:id' do

end
