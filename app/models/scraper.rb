
class Scraper

  attr_accessor :image, :link

  def self.get_image(link = "https://unsplash.com/s/photos/hawaii")
    doc = Nokogiri::HTML(open(link))
    doc.css("._2zEKz").attribute("srcset").text
  end

end
