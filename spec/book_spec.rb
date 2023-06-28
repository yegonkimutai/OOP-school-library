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
    end
end