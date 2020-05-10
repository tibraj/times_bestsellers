class TimesBestsellers::Novel 
  
  attr_accessor :title, :author, :publisher, :weeks_on_list, :synopsis
  
  @@all = []
  
  def initialize(title, author, publisher, weeks_on_list, synopsis)
    @title = title 
    @author = author 
    @publisher = publisher 
    @weeks_on_list = weeks_on_list
    @synopsis = synopsis
    save
  end 
  
  def save
    @@all << self unless @@all.include?(self)
  end 
  
  def self.all 
    if @@all.empty?
      TimesBestsellers::Scraper.scrape_novels
    end
    @@all 
  end
  
end

#done