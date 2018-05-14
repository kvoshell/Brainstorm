class OrderHelper extend ActiveSupport::Concern

  def self.sort_by_filter(filter)
    case filter
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
end
