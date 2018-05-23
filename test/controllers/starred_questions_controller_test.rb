require 'test_helper'

class SavedQuestionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get saved_questions_index_url
    assert_response :success
  end

end
