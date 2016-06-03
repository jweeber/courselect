require_relative '../../lib/course_wrapper'

class CoursesController < ApplicationController

	def index; end

	def show
		keyword = params[:keyword]
		@coursera_results = CourseWrapper.get_coursera_courses(keyword)
		@coursera_search_link = "https://www.coursera.org/courses?languages=en&query="
		@udacity_search = CourseWrapper.get_udacity_courses
		@udacity_results = Course.udacity_courses(@udacity_search, keyword)
		@khan_results = CourseWrapper.get_khan_courses(keyword)
	end

	def show_to_take
		
	end

	def show_taken
		
	end

end
