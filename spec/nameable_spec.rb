require_relative '../nameable'

describe Nameable do
  it 'should raise NotImplementedError' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end

describe Decorator do
  it 'should delegate correct_name to the object' do
    wrapped = double('WrappedObject')
    expect(wrapped).to receive(:correct_name).and_return('John Doe')

    decorator = Decorator.new(wrapped)
    expect(decorator.correct_name).to eq('John Doe')
  end
end

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
