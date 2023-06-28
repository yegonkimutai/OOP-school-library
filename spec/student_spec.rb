require_relative '../student'

describe Student do
  context 'Testing student creation & methods' do
    it 'should create a new student' do
      new_student = Student.new(18, true, 'Abbas')
      expect(new_student.name).to eq('Abbas')
    end

    it 'should check permission' do
      new_student = Student.new(18, false, 'Abbas')
      expect(new_student.parent_permission).to eq(false)
    end

    it 'check method' do
      new_student = Student.new(28, false, 'Asa')
      expect(new_student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
