require_relative 'app'

# def list_options
#   '

#     1 - Add a book
#     2 - Show books
#     3 - Add a person
#     4 - Show people
#     5 - Add a rental
#     6 - Show rentals for a given ID
#     7 - Exit
#   '
# end

# def options(option, app)
#   menu_options = {
#     1 => :add_book,
#     2 => :list_books,
#     3 => :add_person,
#     4 => :list_people,
#     5 => :add_rentals,
#     6 => :list_rentals,
#     7 => :exit
#   }

#   if menu_options.key?(option)
#     if menu_options[option] == :exit
#       exit
#     else
#       send(menu_options[option], app)
#     end
#   else
#     puts 'Invalid selection'
#   end
# end

# def add_book(app)
#   app.new_book
# end

# def list_books(app)
#   app.list_books
# end

# def add_person(app)
#   app.new_person
# end

# def list_people(app)
#   app.list_people
# end

# def add_rentals(app)
#   app.new_rental
# end

# def list_rentals(app)
#   app.list_rentals
# end

# def main
#   app = App.new
#   puts 'Welcome to School Library App!'

#   loop do
#     puts list_options
#     option = gets.chomp.to_i
#     options(option, app)
#   end
# end

# main


class Menu < App
  OPTIONS = {
    1 => :new_book,
    2 => :list_books,
    3 => :new_person,
    4 => :list_people,
    5 => :new_rental,
    6 => :list_rentals,
    7 => :exit
  }.freeze

  def initialize(app)
    super()
    @app = app
  end

  def display_options
    <<~OPTIONS
      1 - Add a book
      2 - Show books
      3 - Add a person
      4 - Show people
      5 - Add a rental
      6 - Show rentals for a given ID
      7 - Exit
    OPTIONS
  end

  def handle_options(option)
    if OPTIONS.key?(option)
      selected_option = OPTIONS[option]
      return exit if selected_option == :exit

      @app.send(selected_option)
    else
      puts 'Invalid selection'
    end
  end
end

class Library
  def initialize
    @app = App.new
    @menu = Menu.new(@app)
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      puts @menu.display_options
      option = gets.chomp.to_i
      @menu.handle_options(option)
    end
  end
end
Library.new.run
