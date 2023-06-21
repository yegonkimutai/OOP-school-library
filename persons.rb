require_relative 'nameable'

class Persons < Nameable
  def initialize(id, age, parent_permission = 'true', name = 'Unknown')
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
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




  # student_1 = Student.new(10, 12, 'true', 'Bill')
  # student_2 = Student.new(15, 15, 'true', 'Bob')

  # class_1 = Classroom.new('A1')
  # class_2 = Classroom.new('A4')

  # class_1.add_student(student_1)
  