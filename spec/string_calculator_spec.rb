# frozen_string_literal: true

RSpec.describe StringCalculator do
  describe 'add(input) method' do
    context 'when impty string given as input' do
      it 'will return 0' do
        expect(described_class.add('')).to eq(0)
      end
    end
  end
end
