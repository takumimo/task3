require 'test_helper'

class BookCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get book_comments_create_url
    assert_response :success
  end

end
