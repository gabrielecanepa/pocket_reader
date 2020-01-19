require "open-uri"
require "nokogiri"

BASE_URL = "https://dev.to".freeze

class Post
  attr_reader :title, :author, :content, :path

  def initialize(path, read = false)
    @path = path
    @read = read
    scrape_and_parse_post
  end

  def read?
    @read
  end

  def mark_as_read!
    @read = true
  end

  private

  def scrape_and_parse_post
    html = open("#{BASE_URL}/#{@path}").read
    parsed_html = Nokogiri::HTML(html)

    @title = parsed_html.search("#main-title .medium").text.strip
    @author = parsed_html.search("#main-title .author").text.strip
    @content = parsed_html.search("#article-body").text.gsub("\n", " ").strip
  end
end
