require 'httparty'

class CourseWrapper
  COURSERA_URL = "https://api.coursera.org/api/courses.v1"
  UDACITY_URL = "https://www.udacity.com/public-api/v0/courses"
  KHAN_URL = "http://www.khanacademy.org/api/v1/topic"

  def self.get_coursera_courses(keyword)
    HTTParty.get(COURSERA_URL + "?q=search&query=#{keyword}&includes=instructorIds,primaryLanguages,photoUrl,description,previewLink&limit=20&fields=instructorIds,primaryLanguages,photoUrl,description,previewLink")["elements"]
  end

  def self.get_udacity_courses
    HTTParty.get(UDACITY_URL)["courses"]
  end

  def self.get_khan_courses(keyword)
    # course search terms > 1 word have dashes in URL instead of spaces
    keyword = keyword.downcase.strip.gsub(' ', '-')
    HTTParty.get(KHAN_URL + "/#{keyword}")["children"]
  end

end