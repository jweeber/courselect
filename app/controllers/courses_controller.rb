require_relative '../../lib/course_wrapper'

class CoursesController < ApplicationController
  include CoursesHelper

  def index; end

  def show
    keyword = params[:keyword]
    @coursera_results = CourseWrapper.get_coursera_courses(keyword)
    @udacity_search = CourseWrapper.get_udacity_courses
    @udacity_results = udacity_courses(@udacity_search, keyword)
    @khan_results = CourseWrapper.get_khan_courses(keyword)
  end

  # def show_to_take
  #   @courses = Course.where(to_take: true)
  # end

  # def show_taken
  #   @courses = Course.where(completed: true)
  # end

end
