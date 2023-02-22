require_relative './app'
class MenuStart
  def initialize
    puts 'Welcome to School Library!'
    @app = App.new(self)
    option_list
  end

  def option_list
    puts "Kindly choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person ID
    7 - Exit"
    user_input = gets.chomp
    select_option(user_input)
  end

  def select_option(user_input)
    menu_list = {
      '1' => :list_all_books,
      '2' => :list_all_people,
      '3' => :create_person,
      '4' => :create_book,
      '5' => :create_rental,
      '6' => :list_rentals_by_person_id,
      '7' => :exit
    }
    option = menu_list[user_input]
    if option.nil?
      puts 'Invalid number'
      option_list
    else
      @app.send(option)
    end
  end
end

def main
  MenuStart.new
end

main
