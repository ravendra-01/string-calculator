# frozen_string_literal: true

# StringCalculator parses and adds numbers from a given input string.
class StringCalculator
  class << self
    # Adds numbers contained in the input string and returns the sum of the numbers.
    def add(input)
      return 0 if input.empty?

      numbers = parse_input(input)
      numbers.sum
    end

    private

    # Returns an array of delimiters delimiters given in string using '//delim1\n'.
    def parse_input(input)
      if input.start_with?('//')
        custom_delimiter, string = input.split("\n", 2)
        custom_delimiter = custom_delimiter.gsub('//', '')
        split_string(string, custom_delimiter)
      else
        split_string(input, /,|\n/)
      end
    end

    # Splits the input string based on a delimiter and returns an array of integers.
    def split_string(string, delim)
      string.split(delim).map(&:to_i)
    end
  end
end
