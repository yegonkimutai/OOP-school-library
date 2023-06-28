require_relative '../persons'
require_relative '../rental'
require 'date'

describe Persons do
  let(:age) { 20 }
  let(:parent_permission) { true }
  let(:name) { 'John Doe' }
  let(:person1) { Persons.new(age, parent_permission, name) }
  let(:date) { Date.new(2023, 6, 28) }
  let(:book) { double('Book') }

  context 'Testing person' do
    it 'Creating name' do
      expect(person1.name).to eq(name)
    end

    it 'creates age' do
      expect(person1.age).to eq(age)
    end

    it 'creates permission' do
      expect(person1.parent_permission).to eq(parent_permission)
    end

    it 'creates empty rentals array' do
      expect(person1.rentals).to be_empty
    end
  end

  it 'Use service method' do
    expect(person1.can_use_services?).to eq(true)
  end

  it 'gives correct name' do
    expect(person1.correct_name).to eq(name)
  end

  it 'creates new rental' do
    expect(Rental).to receive(:new).with(date, book, person1)
    person1.add_rental(date, book)
  end
end
