require_relative '../../lib/course_wrapper'

class CoursesController < ApplicationController

	def index
		
	end

	def show
		keyword = params[:keyword]
		@coursera_results = CourseWrapper.get_coursera_courses(keyword)
		# @coursera_link = Course.coursera_link(@coursera_results)

		# @coursera_instructors = 
		@udacity_results = CourseWrapper.get_udacity_courses(keyword)
	end

end
