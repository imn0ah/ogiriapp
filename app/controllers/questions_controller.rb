class QuestionsController < ApplicationController
    def index
        @categories = Question.distinct.pluck(:category)
    end

    def show
        @question = Question.where(category: params[:category]).order("RANDOM()").first
    end

end
