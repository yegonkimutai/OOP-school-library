class Rental
    attr_accessor :date, :book, :persons

    def initialize(date, book, persons)
        @date = date
        @book = book
        book.rentals << self

        @persons = persons
        persons.rentals << self
    end
end