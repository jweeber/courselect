require 'httparty'

class	CourseWrapper
	COURSERA_URL = "https://api.coursera.org/api/courses.v1"
	UDACITY_URL = "https://www.udacity.com/public-api/v0/courses"

	def get_all_courses
		@coursera
		@udacity
		@udemy
		
	end

	def self.get_coursera_courses(keyword)
		@coursera = HTTParty.get(COURSERA_URL + "?q=search&query=#{keyword}&includes=instructorIds,primaryLanguages,photoUrl,description&fields=instructorIds,primaryLanguages,photoUrl,description")	
	end

	def get_udemy_courses
		@udemy = 
	end

	def get_udacity_courses(keyword)
		@udacity = HTTParty.get(UDACITY_URL)["courses"]
		@searched_for = []
		@udacity.each do |course|
			@searched_for << course if course["title"].include?(keyword)
		end
	end

end