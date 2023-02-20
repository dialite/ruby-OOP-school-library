class Rental
  attr_accessor :date, :book

  def initialize(date, book)
    @date = date

    # a rental belongs to a book
    @book = book
    book.rentals.push(self)
  end  
end
