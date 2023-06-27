require_relative 'persons'
require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'json'

class App
  attr_accessor :person, :books, :rentals

  def initialize
    @person = []
    @books = []
    @rentals = []

    load_data
  end

  def new_book
    puts ''
    print 'Enter title: '
    title = gets.chomp
    print 'Enter author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Adding successful'
    puts ''
  end

  def list_books
    puts ''
    @books.each { |book| puts "Author: #{book.author}, Title: #{book.title}" }
    puts ''
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

    puts 'Adding successful'
    puts ''
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
      puts ''
    end
  end

  def new_rental
    puts ''
    puts 'Select book by number(not id): '

    @books.each_with_index { |book, index| puts "(#{index}) Author: #{book.author}, Title: #{book.title}" }
    book_num = gets.chomp.to_i
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
    puts 'Adding successful'
    puts ''
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
      puts ''
    end
  end

  def get_data(file_name)
    if File.exist?("#{file_name}.json")
      File.read("#{file_name}.json")
    else
      empty_json = [].to_json
      File.write("#{file_name}.json", empty_json)
      empty_json
    end
  end

  def load_data
    books = JSON.parse(get_data('books'))
    people = JSON.parse(get_data('person'))
    rentals = JSON.parse(get_data('rentals'))

    books.each do |book|
      @books << Book.new(book['title'], book['author'])
    end
    people.each do |person|
      @person << if person['type'] == 'Teacher'
                   Teacher.new(person['age'], person['specialization'], person['name'])
                 else
                   Student.new(person['age'], person['parent_permission'], person['name'])
                 end
    end
    rentals.each do |rental|
      renter = @person.select { |person| person.name == rental['person_name'] }
      rented_book = @books.select { |book| book.title == rental['book_titles'] }
      @rentals << Rental.new(rental['date'], rented_book[0], renter[0])
    end
  end

  def update_people
    updated_people = []

    @person.each do |person|
      if person.instance_of?(Teacher)
        updated_people << { 'type' => Teacher, 'name' => person.name, 'age' => person.age,
                            'specialization' => person.specialization }
      elsif person.instance_of?(Student)
        updated_people << { 'type' => Student, 'name' => person.name, 'age' => person.age,
                            'permission' => person.parent_permission }
      end
    end

    File.write('person.json', JSON.generate(updated_people))
  end

  def on_exit
    puts 'Thank you for using the Library'
    updated_books = []

    @books.each do |book|
      updated_books << { 'title' => book.title, 'author' => book.author }
    end

    File.write('books.json', JSON.generate(updated_books))
    update_people
    updated_rentals = []

    @rentals.each do |rental|
      updated_rentals << { 'person_name' => rental.persons.name, 'book_titles' => rental.book.title,
                           'date' => rental.date }
    end

    File.write('rentals.json', JSON.generate(updated_rentals))
    exit
  end
end
