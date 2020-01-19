require_relative "post"
require_relative "view"
require_relative "repository"

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    posts = @repository.all
    @view.display_all_posts(posts)
  end

  def save_for_later
    path = @view.ask_user_for_path
    post = Post.new(path)
  rescue OpenURI::HTTPError   # if there is this error (the post is not found), don't break the program and print an error msg
    @view.print_error_message
  else                        # else, add the post to the repository
    @repository.add(post)
  end

  def read_post
    list
    index = @view.ask_user_for_index
    post = @repository.find(index)
    @view.display_post(post)
  end

  def mark_as_read
    list
    index = @view.ask_user_for_index
    post = @repository.find(index)
    post.mark_as_read!
    list
  end
end
