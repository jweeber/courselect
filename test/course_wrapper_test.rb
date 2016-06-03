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

    it "uses v1 of the Khan Academy API" do
      assert_equal "http://www.khanacademy.org/api/v1/topic", CourseWrapper::KHAN_URL
    end

	  describe "API", :vcr do
	    before do
	      @valid_coursera_search = CourseWrapper.get_coursera_courses("computer science")
	      @invalid_coursera_search = CourseWrapper.get_coursera_courses("jkjkfd")
	    	@valid_udacity_search = CourseWrapper.get_udacity_courses
        @valid_khan_search = CourseWrapper.get_khan_courses("algebra")
        @invalid_khan_search = CourseWrapper.get_khan_courses("jkjkfd")
        @khan_case_insensitive = CourseWrapper.get_khan_courses("Computer Science")
	    end

			it "can call to coursera API and return array of courses", :vcr do
	    	assert_instance_of Array, @valid_coursera_search
			end

			it "returns empty array for cousera search not matching titles", :vcr do
	    	assert_empty @invalid_coursera_search
			end

			it "can call to udacity API and return array of courses", :vcr do
	    	assert_instance_of Array, @valid_udacity_search
			end

      it "can call to khan academy API and return array of courses", :vcr do
        assert_instance_of Array, @valid_khan_search
      end

      it "returns nil for khan academy search not matching titles", :vcr do
        assert_nil @invalid_khan_search
      end

       it "does case insensitive search for khan academy course topics and returns array", :vcr do
        assert_instance_of Array, @khan_case_insensitive
      end

      it "does case insensitive search for khan academy course topics", :vcr do
        assert_equal "Algorithms", @khan_case_insensitive[0]["title"]
      end
		end
  end

end