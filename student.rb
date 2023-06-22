class Student < Persons
  attr_accessor :classroom

  def initialize(age, parent_permission, name = 'Unknown')
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def allocate_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
