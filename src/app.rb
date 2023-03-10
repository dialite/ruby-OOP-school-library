require_relative './data_manager/savedata'
require_relative './create_methods'
require_relative './data_manager/loaddata'

class App
  def initialize
    @books = LoadData.load_books
    @people = LoadData.load_people
    @rentals = LoadData.load_rentals(@books, @people)
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
    loop do
      option_list
      puts 'Please choose an option by entering a number between 1 and 7:'
      user_input = gets.chomp.strip.to_i
      select_option(user_input)
      break if user_input == 7
    end

    puts 'Goodbye...'
    SaveData.save(@books, @people, @rentals)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    print 'Please enter the corresponding number: '
    choice = gets.chomp.strip.to_i

    case choice
    when 1
      CreateMethods.create_student(@people)
    when 2
      CreateMethods.create_teacher(@people)
    else
      puts 'Invalid choice. Please enter 1 or 2.'
      create_person
    end
  end
end
