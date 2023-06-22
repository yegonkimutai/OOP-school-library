#!/usr/bin/env ruby
require_relative 'app'

def list_options
  '
    1 - Add a book
    2 - Show books
    3 - Add a person
    4 - Show people
    5 - Add a rental
    6 - Show rentals for a given ID
    7 - Exit
  '
end

def options(option, app)
  menu_options = {
    1 => :add_book,
    2 => :list_books,
    3 => :add_person,
    4 => :list_people,
    5 => :add_rentals,
    6 => :list_rentals,
    7 => :exit
  }

  if menu_options.key?(option)
    if menu_options[option] == :exit
      exit
    else
      send(menu_options[option], app)
    end
  else
    puts 'Invalid selection'
  end
end

def add_book(app)
  app.new_book
end

def list_books(app)
  app.list_books
end

def add_person(app)
  app.new_person
end

def list_people(app)
  app.list_people
end

def add_rentals(app)
  app.new_rental
end

def list_rentals(app)
  app.list_rentals
end

def main
  app = App.new
  puts 'Welcome to School Library App!'

  loop do
    puts list_options
    option = gets.chomp.to_i
    options(option, app)
  end
end

main
