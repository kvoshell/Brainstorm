class OrderHelper extend ActiveSupport::Concern

  def self.sort_by_filter(order_filter)
    case order_filter
    when 'newest'
      sort = 'created_at DESC'
    when 'oldest'
      sort = 'created_at ASC'
    when 'most_answers'
      sort = 'answers_count DESC'
    when 'least_answers'
      sort = 'answers_count ASC'
    else
      sort = 'created_at DESC'
    end

    sort
  end

  def self.starred_questions_sort_by_filter(starred_questions, order_filter)
    starred_questions_ids = starred_questions.map(&:question_id)

    questions = Question.includes(:answers).find(starred_questions_ids).sort_by(&:answers_count).map(&:id).reverse!

    if order_filter == 'most_answers'
      ordered_questions = starred_questions.sort_by{|x| questions.index x.question_id}
    elsif order_filter = 'least_answers'
      ordered_questions = starred_questions.sort_by{|x| questions.index x.question_id}.reverse!
    end

    ordered_questions
  end
end
