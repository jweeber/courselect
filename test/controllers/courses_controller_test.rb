require 'test_helper'

module CoursesControllerTest

  class IndexAction < ActionController::TestCase
    test "GET index" do
      get :index
      assert_response :success
    end
  end 
end
