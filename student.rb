class Student < Persons
  attr_accessor :classroom

  def initialize(id, age, parent_permission = 'true', name = 'Unknown')
    super(id, age, parent_permission, name)
    @classroom = nil
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def allocate_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
