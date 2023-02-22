require_relative '../src/rental'
require_relative '../src/person'
require_relative '../src/book'

describe Rental do
  before :each do
    @person = Person.new(29, 'zia')
    @book = Book.new('money', 'zia')
    @rental = Rental.new('2022/02/01', @person, @book)
  end

  it 'rental class should be instance of Rental' do
    expect(@rental).to be_an_instance_of Rental
  end

  context 'rental' do
    it 'book and person retals should be one' do
      expect(@rental.date).to eq '2022/02/01'
      expect(@rental.person.rentals.length).to eq(1)
      expect(@rental.book.rentals.length).to eq(1)
    end
  end
end
