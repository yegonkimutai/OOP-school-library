require_relative '../nameable'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'maximilianus') }
  let(:capitalizor) { CapitalizeDecorator.new(nameable) }

  context 'Capitalize persons name' do
    it 'Should capitalize first letter' do
      expect(capitalizor.correct_name).to eq('Maximilianus')
    end
  end
end

describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:trimmer) { TrimmerDecorator.new(nameable) }

  context 'Trimming a name' do
    it 'should trim names to 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('Maximilianus')
      expect(trimmer.correct_name).to eq('Maximilian')
    end

    it 'should not trim names less than 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('John')
      expect(trimmer.correct_name).to eq('John')
    end
  end
end
