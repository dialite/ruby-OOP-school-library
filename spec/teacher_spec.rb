require_relative '../src/teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('math', 30, 'zia', parent_permission: true)
  end

  it 'teacher class should be instance of student' do
    expect(@teacher).to be_an_instance_of Teacher
  end

  context 'details of teacher should be as following' do
    it 'teacher details' do
      expect(@teacher.age).to eq 30
      expect(@teacher.name).to eq 'zia'
      expect(@teacher.specialization).to eq 'math'
    end
  end

  context 'can use services' do
    it 'should return true' do
      expect(@teacher.can_use_services?).to eq true
    end
  end
end