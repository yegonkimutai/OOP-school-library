require_relative 'persons'

class Student < Persons
  attr_accessor :classroom
  
    def initialize(id, age, parent_permission = 'true', name = 'Unknown')
      super(id, age, parent_permission, name)
      @classroom = nil
    end
  
    def play_hooky
      '¯(ツ)/¯'
    end

    def classroom=(classroom)
      @classroom.students.delete(self) if @classroom
      @classroom = classroom
      @classroom.students << self
    end
  end

