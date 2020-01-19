class View
  def display_all_posts(posts)
    posts.each_with_index do |post, index|
      read = post.read? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{read} - #{post.title} (#{post.author})"
    end
  end

  def display_post(post)
    puts post.content
  end

  def ask_user_for_path
    puts "Path?"
    gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    gets.chomp.to_i - 1
  end

  def print_error_message
    puts "Can't find any article at this path"
  end
end
