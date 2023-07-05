class ConsoleInput
  def self.read_line
    gets.chomp
  end

  def self.read_int
    loop do
      print "Enter an integer: "
      input = gets.chomp
      return input.to_i if input.match?(/^\d+$/)
      puts "Invalid input. Please enter an integer."
    end
  end

  def self.read_float
    loop do
      print "Enter a float: "
      input = gets.chomp
      return input.to_f if input.match?(/^\d+(\.\d+)?$/)
      puts "Invalid input. Please enter a float."
    end
  end

  def self.read_choice(options)
    loop do
      print "Enter your choice: "
      choice = gets.chomp
      return choice if options.include?(choice)
      puts "Invalid choice. Please try again."
    end
  end

  def self.read_multiple_ints
    loop do
      print "Enter multiple integers separated by spaces: "
      input = gets.chomp
      begin
        return input.split.map(&:to_i)
      rescue ArgumentError
        puts "Invalid input. Please enter integers separated by spaces."
      end
    end
  end
end
