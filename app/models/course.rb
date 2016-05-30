class Course < ActiveRecord::Base

	# def self.coursera_link(coursera_results)
	# 	links = []
	# 	 coursera_results.each do |course|
	# 		links << "https://www.coursera.org/course/#{course["slug"]}"
	# 	end
	# 	return links unless links.nil?
	# end

	# def self.coursera_search(search_results)
	# 	search_results.each do |course|
	# 		puts course["name"]
	# 		puts course
	# 	end
		
	# end

	def self.udacity_courses(search_results, keyword)
			@searched_for = []
			search_results.each do |course|
				if course["title"].downcase.include?(keyword.downcase)
					@searched_for << course
				end
		end
		return @searched_for
	end

end
