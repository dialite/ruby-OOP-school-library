require_relative '../src/classroom'


describe Classroom do
  before :each do
    @classroom = Classroom.new('E-4')
  end

  context 'details of created classroom' do
    it 'classroom`s label should be E-4' do
      expect(@classroom.label).to eq 'E-4'
    end
  end
end