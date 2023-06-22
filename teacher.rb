require_relative 'persons'

class Teacher < Persons
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', parent_permission = 'true')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
