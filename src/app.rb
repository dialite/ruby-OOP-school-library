require_relative './data_manager/savedata'
require_relative './create_methods'


class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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
  end
  def select_option(user_input)
    case user_input
    when 1
      ListMethods.list_books(@books)
    when 2
      ListMethods.list_people(@people)
    when 3
      create_person
    when 4
      CreateMethods.create_book(@books)
    when 5
      CreateMethods.create_rental(@people, @books, @rentals)
    when 6
      ListMethods.list_rentals(@people)
    end
  end

  def process
    user_input = 0
    while user_input != 7
      option_list
      puts 'Kindly choose an option by entering a number [From 1-7]'
      user_input = gets.chomp.strip.to_i
      select_option(user_input)
    end
    puts 'Goodbye...' 
    SaveData.save(@books, @people, @rentals)
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp.strip.to_i
    case choice
    when 1
      CreateMethods.create_student(@people)
    when 2
      CreateMethods.create_teacher(@people)
    end
  end
end

