class QuestionsController < ApplicationController
    def index
        @categories = Question.distinct.pluck(:category)
    end

    def show
        @question = QuestionGeneratorService.new(params[:category]).call
    end
end
