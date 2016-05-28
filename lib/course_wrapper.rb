require 'httparty'

class	CourseWrapper
	BASE_URL = "https://api.coursera.org/api/courses.v1"

	def self.get_coursera_courses(keyword)
		HTTParty.get(BASE_URL + "?q=search&query=#{keyword}&includes=instructorIds,primaryLanguages,photoUrl,description&fields=instructorIds,primaryLanguages,photoUrl,description")	
	end

end