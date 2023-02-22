require_relative '../src/student'
require_relative '../src/classroom'

describe Student do
  before :each do
    @student = Student.new(26, nil, 'zia', parent_permission: true)
  end

  it 'student class returns student object' do
    expect(@student).to be_an_instance_of Student
  end

  context 'details of created student should be as following' do
    it 'student details' do
      expect(@student.age).to eq 26
      expect(@student.name).to eq 'zia'
      expect(@student.can_use_services?).to be true
      expect(@student.classroom).to be nil
    end
  end

  context 'hooky method' do
    it 'should return ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
