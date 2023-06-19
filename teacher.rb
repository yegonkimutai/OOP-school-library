require_relative 'persons'

class Teacher < Persons
  def initialize(id, age, specialization, parent_permission: true, name = 'Unknown')
    super(id, age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
