require "csv"
require_relative "post"

class Repository
  def initialize(csv_file_path)
    @posts = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @posts
  end

  def find(index)
    @posts[index]
  end

  def add(post)
    @posts << post
    write_csv
  end

  def remove(index)
    @posts.delete_at(index)
    write_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @posts << Post.new(row[0], row[1])
    end
  end

  def write_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.read?]
      end
    end
  end
end
