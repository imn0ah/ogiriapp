class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    redirect_to questions_show_path(category: @question.category)
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
