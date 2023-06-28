require_relative '../book'
require_relative '../rental'
require 'date'

describe Book do
  let(:title) { 'The Great Gatsby' }
  let(:author) { 'F. Scott Fitzgerald' }
  let(:book) { Book.new(title, author) }
  let(:person) { double('Person') }
  let(:date) { Date.new(2023, 6, 28) }

  context 'Creating new book' do
    it 'Should return title' do
      expect(book.title).to eq(title)
    end

    it 'Should return author' do
      expect(book.author).to eq(author)
    end

    it 'Should return empty rental' do
      expect(book.rentals).to be_empty
    end

    it 'should add rental' do
      expect(Rental).to receive(:new).with(date, book, person)
      book.add_rental(person, date)
    end
  end
end
