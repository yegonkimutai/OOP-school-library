require_relative '../book'

describe Book do
  context 'Creating new book' do
    it 'Should return title' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.title).to eq('Title')
    end

    it 'Should return author' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.author).to eq('Author')
    end

    it 'Should return empty rental' do
      new_book = Book.new('Title', 'Author')
      expect(new_book.rentals).to be_empty
    end
  end
end
