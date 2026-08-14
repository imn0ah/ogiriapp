class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)

    redirect_to answer_path(@answer)
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def post_to_sns
    @answer = Answer.find(params[:id])

    @post_text = <<~TEXT
      【お題】
      #{@answer.question.content}

      【回答】
      #{@answer.content}

      #大喜利
    TEXT

     redirect_to "https://twitter.com/intent/tweet?text=#{ERB::Util.url_encode(@post_text)}",
              allow_other_host: true
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
