# frozen_string_literal: true

# StringCalculator parses and adds numbers from a given input string.
class StringCalculator
  # Adds numbers contained in the input string and returns the sum of the numbers.
  def self.add(input)
    return 0 if input.empty?

    numbers = input.split(',').map(&:to_i)
    numbers.sum
  end
end
