require_relative '../persons'

describe Persons do
  context 'Testing person' do
    it 'Creating person' do
      person1 = Persons.new(18, true, 'Wrdy')
      expect(person1.name).to eq('Wrdy')
    end

    it 'Use service method' do
      person2 = Persons.new(14, false, 'Wese')
      expect(person2.can_use_services?).to eq(false)
    end
  end
end
