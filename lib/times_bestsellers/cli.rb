class TimesBestsellers::CLI 
  
  def call 
    puts "Welcome! Here is the New York Times' Bestsellers List for Paperback Fiction:"
    puts "-----"
      novels
      show_list 
      puts "-----"
      novel_selection
      puts "-----"
      continue? 
    end
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
  
  def valid? (input, array)
    input.to_i <= array.length && input.to_i > 0
  end 
  
  def novel_selection
    puts "Which novel would you like to learn more about? (Enter 1-15)"
    puts "-----"
    novel_selected = gets.strip.to_i 
    if valid?(novel_selected, @novels)
      show_info(novel_selected)
    else
      puts "-----"
      puts "*Please enter a number between 1 & 15*"
      puts "-----"
      novel_selection
    end 
  end 
    
  def show_info(novel_selected)
    puts "-----"
      puts "Publisher: " + "#{novels[novel_selected.to_i - 1].publisher}"
      puts novels[novel_selected.to_i - 1].weeks_on_list
      puts "Synopsis: " + "#{novels[novel_selected.to_i - 1].synopsis}"
  end  

  def continue?
    puts "Would you like another look at the list? (Y/N)"
    user_action = gets.strip 
    if user_action.upcase == "Y"
      call 
    elsif user_action.upcase == "N"
      puts "Goodbye!"
    else
      puts "-----"
      puts "*Please enter Y or N*"
      continue?
    end
  end
