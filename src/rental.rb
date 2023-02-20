class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    # a rental belongs to a book
    @book = book
    book.rentals << self

    # a rental belongs to a person
    @person = person
    person.rentals << self
  end
end
