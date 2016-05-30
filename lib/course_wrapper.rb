require 'httparty'

class	CourseWrapper
	COURSERA_URL = "https://api.coursera.org/api/courses.v1"
	UDACITY_URL = "https://www.udacity.com/public-api/v0/courses"

	def self.get_coursera_courses(keyword)
		@coursera = HTTParty.get(COURSERA_URL + "?q=search&query=#{keyword}&includes=instructorIds,primaryLanguages,photoUrl,description,previewLink&limit=20&fields=instructorIds,primaryLanguages,photoUrl,description,previewLink")["elements"]	
	end

	# def self.get_udemy_courses
	# 	@udemy = 
	# end

	def self.get_udacity_courses(keyword)
		@udacity = HTTParty.get(UDACITY_URL)["courses"]
		@searched_for = []
			@udacity.each do |course|
				if course["title"].downcase.include?(keyword.downcase)
					@searched_for << course
				end
		end
		return @searched_for
	end

end