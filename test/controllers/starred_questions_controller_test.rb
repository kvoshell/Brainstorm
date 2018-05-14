require 'test_helper'

class StarredQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get starred_questions_index_url
    assert_response :success
  end

end
