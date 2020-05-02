require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = open(index_url) #grabs the html 
    doc = Nokogiri::HTML(html) #saves the nested nodes into a variable doc 
  
    doc.css(".student-card").text.each do |student| 
      student_info = {}
      student_info[:name] = student.css(".h4.student-name")
      
  end 
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

