require_relative './app'
class MenuStart
  def initialize
    option_list
  end

  def option_list
    puts 'Welcome to School Library!'
    puts "Kindly choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person ID
    7 - Exit"
  end
end

def main
  MenuStart.new
end

main
