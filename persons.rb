require_relative 'nameable'

class Persons < Nameable
  attr_accessor :name, :age

  attr_reader :id, :rentals, :parent_permission

  def initialize(age, parent_permission, name = 'Unknown')
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
