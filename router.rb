class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    while @running
      print_options
      action = gets.chomp.to_i
      execute_action(action)
    end
  end

  private

  def print_options
    puts "-----------------------"
    puts "What do you want to do?"
    puts "1. List posts"
    puts "2. Save post for later"
    puts "3. Read post"
    puts "4. Mark post as read"
    puts "5. Exit"
  end

  def execute_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.save_for_later
    when 3 then @controller.read_post
    when 4 then @controller.mark_as_read
    when 5 then @running = false
    else
      puts "Please select 1, 2, 3, 4, or 5"
    end
  end
end
