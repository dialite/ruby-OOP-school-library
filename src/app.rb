require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'

class App
  def initialize(menu)
    @menu = menu
    @books = []
    @people = []
    @rentals = []
  end
end