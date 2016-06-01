class Course < ActiveRecord::Base
  
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
