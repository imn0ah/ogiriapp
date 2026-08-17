class QuestionGeneratorService
  MAX_RETRIES = 3

  def initialize(category)
    @category = category
  end

  def call
    recent_questions = Question.where(
      category: @category,
      created_at: 24.hours.ago..
    ).pluck(:content)

    client = OpenAI::Client.new(
      api_key: ENV["OPENAI_API_KEY"]
    )

    MAX_RETRIES.times do
      response = client.responses.create(
        model: "gpt-5-mini",
        input: <<~PROMPT
          #{@category}に関する大喜利のお題を1つだけ作ってください。
          お題本文だけを返してください。

          以下のお題とは異なる内容にしてください。
          #{recent_questions.join("\n")}
        PROMPT
      )

      content = response.output_text.strip

      unless recent_questions.include?(content)
        return Question.create!(
          category: @category,
          content: content
        )
      end
    end

    fallback_question
  end

  private

  def fallback_question
    Question.where(category: @category)
            .order("RANDOM()")
            .first
  end
end