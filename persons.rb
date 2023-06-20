require_relative 'nameable'

class Persons < Nameable
  def initialize(id, age, parent_permission = 'true', name = 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id

  attr_accessor :name, :age

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

class Nameable
  def correct_name
    raise NotImplementedError
  end
end

class Decorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    words = @nameable.correct_name
    words.length > 10 ? words.chars[0..9].join : words
  end
end

person = Persons.new(250, 15, 'false', 'maximilianus')

