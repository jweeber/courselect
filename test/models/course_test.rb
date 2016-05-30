require 'test_helper'

class CourseTest < ActiveSupport::TestCase

	def setup
		@course_search = [{
  		"title" => "Computer Science 101",
  		"instructor" => "Jane Smith",
  		"subtitle" => "Learning Computer Science Basics"
  	}]
  	@keyword = "computer science"
		
	end
	
  test "returns an array of udacity courses" do
    assert_instance_of Array, Course.udacity_courses(@course_search, @keyword)
  end

  test "udacity keyword search is case insensitive" do
  	@search_results = Course.udacity_courses(@course_search, @keyword).first
    assert_equal "Computer Science 101", @search_results["title"]
  end
end
