require 'test_helper'

module CoursesControllerTest
  class IndexShowAction < ActionController::TestCase

    test "can get index page" do
      get :index

      assert_response :success
    end

  end
  
end
