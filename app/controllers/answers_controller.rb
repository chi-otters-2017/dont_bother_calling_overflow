get "/questions/:id/answers/new" do
	@question = Question.find(params[:id])

	erb :"answers/new"
end

post "/questions/:id/answers" do
	@question = Question.find(params[:id])

	@answer = Answer.new(body: params[:body], question_id: @question.id, user_id: session[:id])

	if @answer.save
		if request.xhr?

		else
	  	redirect "/questions/#{@question.id}"
	  end
	else
		@errors = @answer.errors.full_messages

	  erb :'answers/new'
	end
end

post "/answers/:id" do
	@answer = Answer.find(params[:id])
	@answer.best_answer = true
	@answer.save
	question = @answer.question
	redirect "/questions/#{question.id}"
end
