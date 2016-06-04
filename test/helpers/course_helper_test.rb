require 'test_helper'

class CoursesHelperTest < ActiveSupport::TestCase
  include CoursesHelper

  def setup
    @course_search = [{
      "title" => "Computer Science 101",
      "instructor" => "Jane Smith",
      "subtitle" => "Learning Computer Science Basics"
    }]
    @keyword = "computer science"
    @description = "This is a description with three sentences. This is the second sentence. This should return only the first sentence."
  end
  
  test "returns an array of udacity courses" do
    assert_instance_of Array, udacity_courses(@course_search, @keyword)
  end

  test "udacity keyword search is case insensitive" do
    @search_results = udacity_courses(@course_search, @keyword).first
    assert_equal "Computer Science 101", @search_results["title"]
  end

  test "should return coursera search link" do 
    assert_equal "https://www.coursera.org/courses?languages=en&query=", coursera_search_link 
  end

  test "should return only the first sentence to match courses with a description" do 
    assert_equal "This is a description with three sentences. ", description_match(@description)
  end

  test "should return only the first sentence to match courses with a summary" do 
    assert_equal "This is a description with three sentences. ", summary_match(@description)
  end

end