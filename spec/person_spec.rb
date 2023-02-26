require_relative '../src/person'
require_relative '../src/book'
require_relative '../src/rental'

describe Person do
  before :each do
    @person = Person.new(22, 'Zia')
  end

  context 'details of created person should be as follow' do
    it 'details of person' do
      expect(@person.age).to eq 22
      expect(@person.name).to eq 'Zia'
      expect(@person.can_use_services?).to eq true
    end
  end

  context 'Can a person use services' do
    it "can_use_services? method returns true if age > 18 and parent permission == 'y'" do
      expect(@person.can_use_services?).to eql true
    end
  end

  context 'A person rent a book' do
    it 'length of rentals should increase by one' do
      @person.add_rental('2022/08/30', Book.new('js', 'zia'))
      expect(@person.rentals.length).to be 1
      expect(@person.rentals[0].book.title).to eq 'js'
      expect(@person.rentals[0].book.author).to eq 'zia'
    end
  end
end
