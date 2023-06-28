require 'date'
require_relative '../rental'

describe Rental do
  let(:date) { Date.new(2023, 6, 28) }
  let(:book) { double('Book', rentals: []) }
  let(:persons) { double('Persons', rentals: []) }

  subject { Rental.new(date, book, persons) }

  describe 'initialize' do
    it 'sets the date' do
      expect(subject.date).to eq(date)
    end

    it 'adds to the book rentals' do
        subject
        expect(book.rentals).to include(subject)
      end
  
      it 'adds to the persons rentals' do
        subject
        expect(persons.rentals).to include(subject)
      end
  end
end
