require_relative 'persons'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :person, :books, :rentals

  def initialize
    @person = []
    @books = []
    @rentals = []
  end

  def new_book
    puts ''
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Adding successful'
  end

  def list_books
    puts ''
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
  end

  def new_person
    puts ''
    print 'Enter 1 to add Student and 2 to add Teacher: '
    choice = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i

    case choice
    when 1
      print 'Does student have permission [Y/n]: '
      permission = gets.chomp.downcase == 'y'
      @person << Student.new(age, permission, name)

    when 2
      print 'What is teachers specialization: '
      specialization = gets.chomp
      @person << Teacher.new(age, specialization, name)
    end

    print 'Adding successful'
  end

  def list_people
    puts ''
    @person.each do |person|
      puts ''
      puts "[#{person.class}]"
      puts "Name: #{person.name}"
      puts "Age: #{person.age}"

      if person.instance_of?(Student)
        puts "Permission: [#{person.parent_permission}]"
      else
        puts "Specialization: [#{person.specialization}]"
      end
    end
  end

  def new_rental
    puts ''
    puts 'Select book by number(not id): '

    @books.each_with_index { |book, index| puts "(#{index}) Author: #{book.author}, Title: #{book.title}" }
    puts ''
    book_num = gets.chomp.to_i
    puts ''

    puts ''
    puts 'Select person by number(not id): '

    @person.each_with_index do |person, index|
      puts "(#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    puts ''
    person_num = gets.chomp.to_i
    puts ''

    print 'Date(yyyy/mm/dd): '
    date = gets.chomp

    rental = Rental.new(date, @books[book_num], @person[person_num])
    @rentals << rental
    puts ''
    print 'Adding successful'
  end

  def list_rentals
    puts ''
    puts 'All ID\'s: '
    @rentals.each do |rental|
      puts rental.persons.id if rental.persons.id
    end
    puts ''

    print 'Please enter an ID for more details: '
    id = gets.chomp.to_i
    puts ''

    puts 'Rental(s) for ID: '
    @rentals.each do |rental|
      if rental.persons.id.eql?(id)
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'Person does not exist'
      end
    end
  end
end