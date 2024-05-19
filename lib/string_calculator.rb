# frozen_string_literal: true

# StringCalculator parses and adds numbers from a given input string.
class StringCalculator
  class << self
    # Adds numbers contained in the input string and returns the sum of the numbers.
    def add(input)
      return 0 if input.empty?

      numbers = parse_input(input)
      check_for_negatives(numbers)
      numbers.reject { |num| num > 1000 }.sum
    end

    private

    # Parses the input string based on the presence of custom delimiters and returns an array of numbers.
    def parse_input(input)
      if input.start_with?('//')
        custom_delimiter, string = input.split("\n", 2)
        extract_delimiters(custom_delimiter, string)
      else
        split_string(input, /,|\n/)
      end
    end

    # Returns an array of delimiters given in string using format: '//[delim1][delim2]\n' or '//delim1\n'.
    def extract_delimiters(custom_delimiter, string)
      if custom_delimiter.start_with?('//[')
        custom_delimiter = custom_delimiter.scan(/\[(.*?)\]/).flatten
        split_string(string, Regexp.union(custom_delimiter))
      else
        custom_delimiter = custom_delimiter.gsub('//', '')
        split_string(string, custom_delimiter)
      end
    end

    # Splits the input string based on a delimiter and returns an array of integers.
    def split_string(string, delim)
      string.split(delim).map(&:to_i)
    end

    # Checks for negative numbers in the provided array.
    # If negative numbers are found, raises an exception and provide the list of negative numbers.
    def check_for_negatives(numbers)
      negatives = numbers.select(&:negative?)
      raise "negative numbers not allowed #{negatives.join(',')}" if negatives.any?
    end
  end
end
