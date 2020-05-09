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
  
  def valid?(input)
    if input.to_i <= 15 && input.to_i > 0
      true 
    end 
  end 
  
  def show_info(input)
    puts "-----"
    if valid?(input.to_i) == true 
      puts "Publisher: " + "#{@novels[input.to_i - 1].publisher}"
      puts @novels[input.to_i - 1].weeks_on_list
      puts "Synopsis: " + "#{@novels[input.to_i - 1].synopsis}"
    else
      puts "*Please enter a number between 1 & 15*"
      puts "-----"
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