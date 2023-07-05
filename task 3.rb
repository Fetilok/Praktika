class ConsoleInput
  def self.get_input(prompt)
    print prompt
    gets.chomp
  end
end

class Person
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_s
    "Name: #{@name}, Age: #{@age}"
  end
end

class PersonRepository
  def initialize
    @persons = []
  end

  def add_person(person)
    @persons << person
  end

  def get_all_persons
    @persons
  end
end

# Example usage:
repository = PersonRepository.new

loop do
  puts "Enter person details (name, age), or 'q' to quit:"

  name_input = ConsoleInput.get_input("Name: ")
  break if name_input == "q"

  age_input = ConsoleInput.get_input("Age: ")
  break if age_input == "q"

  person = Person.new(name_input, age_input.to_i)
  repository.add_person(person)
end

puts "\nAll persons:"
repository.get_all_persons.each { |person| puts person }
