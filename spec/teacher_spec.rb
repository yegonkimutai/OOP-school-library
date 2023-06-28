require_relative '../teacher'

describe Teacher do
  context 'Creating teacher and checking values' do
    it 'It should create teacher' do
      teacher = Teacher.new(18, 'Maths', 'Dave', true)
      expect(teacher.name).to eq('Dave')
    end

    it 'Return speciality' do
      teacher = Teacher.new(18, 'Bio', 'Mister', true)
      expect(teacher.specialization).to eq('Bio')
    end

    it 'Use service' do
      teacher = Teacher.new(18, 'maths', 'Col', true)
      expect(teacher.can_use_services?).to eq(true)
    end
  end
end
