# frozen_string_literal: true

require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe 'add(input) method' do
    context 'when impty string given as input' do
      it 'will return 0' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context 'when input contains single numbers' do
      it 'will return number itself' do
        expect(described_class.add('5')).to eq(5)
      end
    end

    context 'when input contains multiple numbers separated by commas' do
      it 'will return sum of the numbers' do
        expect(described_class.add('1,5')).to eq(6)
      end
    end

    context 'when commas and new lines are considered as delimiter' do
      it 'will return sum of the numbers' do
        expect(described_class.add("1\n2,3")).to eq(6)
      end
    end

    context 'when input contains a custom delimiter using format: "//[delimiter]\n"' do
      it 'will return sum of the numbers' do
        expect(described_class.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when negative numbers present in input' do
      it 'will raise exception' do
        error = 'negative numbers not allowed -2,-3'
        expect { StringCalculator.add("//;\n1;-2;-3") }.to raise_error(RuntimeError, error)
      end
    end

    context 'when input includes numbers greater than 1000' do
      it 'will ignores numbers greater than 1000 and returns the sum of the rest' do
        expect(described_class.add("//;\n1;2;3000")).to eq(3)
      end

      it 'will return 0 if all numbers are greater than 1000' do
        expect(described_class.add("//;\n1001;2000;3000")).to eq(0)
      end
    end

    context 'when input contains multiple custom delimiters within brackets using format: "//[delim1][delim2]\n"' do
      it 'will return sum of the numbers' do
        expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end
  end
end
