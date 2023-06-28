require_relative '../nameable'

describe CapitalizeDecorator do
  context 'Capitalize and trim' do
    it 'Capitalize word' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('hello')
      decorator = CapitalizeDecorator.new(nameable)
      expect(decorator.correct_name).to eq('Hello')
    end
  end
end

describe TrimmerDecorator do
  context 'Capitalize and trim' do
    it 'Trim long word' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('verylongword')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('verylongwo')
    end

    it 'Do not trim short word' do
      nameable = double('Nameable')
      allow(nameable).to receive(:correct_name).and_return('short')
      decorator = TrimmerDecorator.new(nameable)
      expect(decorator.correct_name).to eq('short')
    end
  end
end
