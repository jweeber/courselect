require 'httparty'

class CourseWrapper
  COURSERA_COURSE_URL = "https://api.coursera.org/api/courses.v1"
  COURSERA_INSTRUCTOR_URL = "https://api.coursera.org/api/instructors.v1"
  UDACITY_URL = "https://www.udacity.com/public-api/v0/courses"
  KHAN_URL = "http://www.khanacademy.org/api/v1/topic"

  def self.get_coursera_courses(keyword)
    HTTParty.get(COURSERA_COURSE_URL + "?q=search&query=#{keyword}&includes=instructorIds,primaryLanguages,photoUrl,description,previewLink&limit=20&fields=instructorIds,primaryLanguages,photoUrl,description,previewLink")["elements"]
  end

  def self.get_udacity_courses
    HTTParty.get(UDACITY_URL)["courses"]
  end

  def self.get_khan_courses(keyword)
    HTTParty.get(KHAN_URL + "/#{keyword}")["children"]
  end

end