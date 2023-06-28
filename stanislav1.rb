require 'date'

module Validation
  MAX_NAME_LENGTH = 40
  NAME_REGEX = /\A[A-Za-z\-]+\z/
  INN_REGEX = /\A[A-Z]{2}\d{10}\z/

  def self.valid_name?(string)
    return false if string.length > MAX_NAME_LENGTH
    return false unless string.match?(NAME_REGEX)
    true
  end

  def self.valid_inn?(string)
    string.match?(INN_REGEX)
  end

  def self.after_date?(date)
    date <= Date.today
  end
end
puts Validation.valid_name?("Maria-Anna")  # true
puts Validation.valid_name?("John Doe")    # false (contains a space)
puts Validation.valid_name?("VeryLongNameThatExceedsTheMaxLengthDefined")  # false (too long)

puts Validation.valid_inn?("AZ1234543456")  # true
puts Validation.valid_inn?("ABCD12345678")  # false (invalid format)
puts Validation.valid_inn?("AB1234567890")  # false (invalid format)

puts Validation.after_date?(Date.today)               # true
puts Validation.after_date?(Date.new(1990, 1, 1))     # true
puts Validation.after_date?(Date.new(2050, 12, 31))   # false (future date)
