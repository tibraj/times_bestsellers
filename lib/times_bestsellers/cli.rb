class TimesBestsellers::CLI 
  
  def call 
    puts "Welcome! Here is the New York Times' Bestsellers List for Paperback Fiction:"
    puts "-----"
    novels
    show_list 
    puts "-----"
    show_info
    puts "-----"
    continue? 
  end

  def novels
    @novels = TimesBestsellers::Novel.all
  end

  def show_list
    @novels.each.with_index(1) do |novel, index|
      puts "#{index}: #{novel.title} " + "#{novel.author}"
      "done"
    end 
  end 

  def show_info
    puts "Which novel would you like to learn more about? (Enter 1-15)"
    user_choice = gets.strip
    puts "-----"
    if user_choice.to_i <= 15 && user_choice.to_i > 0
      puts "Publisher: " + "#{@novels[user_choice.to_i - 1].publisher}"
      puts @novels[user_choice.to_i - 1].weeks_on_list
      puts "Synopsis: " + "#{@novels[user_choice.to_i - 1].synopsis}"
    else 
      show_info 
    end 
  end 

  def continue?
    puts "Would you like another look at the list? (Y/N)"
    user_action = gets.strip 
    if user_action.upcase == "Y"
      call 
    elsif user_action.upcase == "N"
      puts "Goodbye"
    else
      puts "-----"
      puts "*Please enter Y or N*"
      puts "-----"
      continue?
    end
  end

end 