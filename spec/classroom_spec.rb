require_relative '../classroom'

describe Classroom do
 let(:label) { 'A1' }
 let(:classroom) { Classroom.new(label) }
 let(:student) { double('Student') }

 context 'initialize' do
    it 'sets label' do
        expect(classroom.label).to eq(label)
    end

    it 'initialize empty students array' do
        expect(classroom.students).to be_empty
    end

    it 'should add student to classroom and also students array' do
        allow(student).to receive(:classroom=)
        classroom.add_student(student)
        expect(student).to have_received(:classroom=).with(classroom)
        expect(classroom.students).to include(student)
    end
 end
end