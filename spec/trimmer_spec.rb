require_relative '../src/decorator/trimmer_decorator'
require_relative '../src/person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(23, 'qwertyuiopas')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  context 'trimer_decorator is an instance of TrimmerDecorator' do
    it 'should be an instance of TrimmerDecorator' do
      expect(@trimmer_decorator).to be_an_instance_of TrimmerDecorator
    end
  end
end
