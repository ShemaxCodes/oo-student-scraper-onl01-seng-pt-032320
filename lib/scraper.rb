require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    students = []
    html = open(index_url) #grabs the html 
    doc = Nokogiri::HTML(html) #saves the nested nodes into a variable doc 
  
    doc.css(".student-card").each do |student| 
      student_info = {}
      student_info[:name] = student.css("h4.student-name").text
      student_info[:location] = student.css("p.student-location").text 
      student_info[:profile_url] = student.css("a").attribute("href").text
      students << student_info
      
  end 
  students 
  end

  def self.scrape_profile_page(profile_url)
    student = {}
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    
    links = doc.css(".social-icon-container").children.css("a").map {|icon| icon.attribute('href').value}
    links.each do |link|
      if link.include?("linkedin")
        student[:linkedin] = link 
      elsif link.include?("github")
        student[:github] = link 
      elsif link.include?("twitter")
        student[:twitter] = link 
      else 
        student[:blog] = link 
    
  end

end
      student[:profile_quote] = doc.css(".profile-quote").text
      student[:bio] = doc.css(".description-holder p").text
      
      student 
      
    end 
    
  end 
      
