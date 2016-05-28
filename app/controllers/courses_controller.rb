require_relative '../../lib/course_wrapper'

class CoursesController < ApplicationController

	def index
		keyword = params[:keyword]
		@coursera_courses = CourseWrapper.get_coursera_courses("keyword")
	end

end
