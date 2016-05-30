require 'test_helper'
require	'course_wrapper'

class CourseWrapperTest < ActiveSupport::TestCase

	describe CourseWrapper do

    it "uses v1 of the Coursera API" do
      assert_equal "https://api.coursera.org/api/courses.v1", CourseWrapper::COURSERA_URL
    end

    it "uses v0 of the Udacity API" do
    	assert_equal "https://www.udacity.com/public-api/v0/courses", CourseWrapper::UDACITY_URL
    end


	  describe "API", :vcr do
	    before do
	      @valid_coursera_search = CourseWrapper.get_coursera_courses("computer science")
	      @invalid_coursera_search = CourseWrapper.get_coursera_courses("jkjkfd")
	    end

			it "can call to coursera API and return array of courses", :vcr do
	    	assert_instance_of Array, @valid_coursera_search
			end

			it "returns empty array for search that doesn't match course titles", :vcr do
	    	assert_empty @invalid_coursera_search
			end




		end
  end

end