require_relative '../../lib/course_wrapper'

class CoursesController < ApplicationController

	def index
		
	end

	def show
		keyword = params[:keyword]
		@coursera_results = CourseWrapper.get_coursera_courses(keyword)
		@udacity_search = CourseWrapper.get_udacity_courses(keyword)
		@udacity_results = Course.udacity_courses(@udacity_search, keyword)
	end

end
