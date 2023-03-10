require_relative './rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # A book has many rentals
  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
