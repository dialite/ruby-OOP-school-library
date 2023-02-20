require_relative './rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  # A book has many rentals
  def add_rentals=(person, date)
    Rental.new(self, person, date)
  end
end
