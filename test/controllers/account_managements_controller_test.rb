require 'test_helper'

class AccountManagementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get project_managements_index_url
    assert_response :success
  end

end
