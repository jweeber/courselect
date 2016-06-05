module CoursesHelper

  def coursera_search_link
    "https://www.coursera.org/courses?languages=en&query="   
  end

  def udacity_courses(search_results, keyword)
      searched_for = []
      search_results.each do |course|
        if course["title"].downcase.include?(keyword.downcase)
          searched_for << course
        end
    end
    return searched_for
  end

  def description_match(description)
    description.match(/^.*?[\.!\?](?:\s|$)/).to_s
  end

  def summary_match(summary)
    summary.match(/^.*?[\.!\?](?:\s|$)/).to_s  
  end

end
