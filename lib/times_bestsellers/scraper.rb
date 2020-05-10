class TimesBestsellers::Scraper
  
  def self.scrape_novels 
    doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/trade-fiction-paperback/"))
    novels = doc.css("div.css-46u0bd section.css-19a8fbx li.css-13y32ub")
    novels.each do |novel|
      TimesBestsellers::Novel.new(
        title = novel.css("h3.css-5pe77f").text.strip,
        author = novel.css("p.css-hjukut").text.strip,
        publisher = novel.css("p.css-heg334").text.strip,
        weeks_on_list = novel.css("p.css-1o26r9v").text.strip,
        synopsis = novel.css("p.css-14lubdp").text.strip
        )
    end 
  end 
    
end

#done 