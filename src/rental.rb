class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals << self
  end
end

