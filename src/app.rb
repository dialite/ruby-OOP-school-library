require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './create_contents/create_book'
require_relative './create_contents/create_person'
require_relative './create_contents/create_rental'
class App
  def initialize(menu)
    @menu = menu
    @books = LoadData.load_books
    @people = []
    @rentals = []
  end

  def list_all_books(show_index: false)
    puts 'There are no books yet! Kindly add books.' if @books.empty?

    @books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"
      result = " [#{index}] " + result if show_index
      puts result
    end
    sleep 0.75
    @menu.option_list
  end

  def list_all_people(show_index: false)
    puts 'There is nobody yet! Kindly add a student or a teacher.' if @people.empty?

    @people.each_with_index do |person, index|
      result = "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result if show_index
      puts result
    end
    sleep 0.75
    @menu.option_list
  end

  def list_rentals_by_person_id
    puts 'No person entry found' if @people.empty?
    @menu.option_list
    puts 'Enter person ID: '
    id = gets.chomp.to_i
    @people.each do |person|
      next unless person.id == id

      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
      end
    end
    sleep 0.75
    @menu.option_list
  end

  def exit
    puts 'Goodbye...'
  end
end
