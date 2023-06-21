require_relative 'nameable'

class Persons < Nameable
  attr_accessor :name, :age

  attr_reader :id, :rentals

  def initialize(id, age, parent_permission = 'true', name = 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
