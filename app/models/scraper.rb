
class Scraper

  attr_accessor :image, :link

  def self.get_image(link = "http://pexels.com/search/hawaii")
    doc = Nokogiri::HTML(open(link))
    doc.css(".photos img").attribute("src").text
  end

end
