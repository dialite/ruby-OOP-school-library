require_relative './book'
require_relative './classroom'
require_relative './person'
require_relative './rental'
require_relative './student'
require_relative './teacher'
require_relative './create_contents/create_book'
require_relative './create_contents/create_person'
class App
  def initialize(menu)
    @menu = menu
    @books = []
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

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i
    puts 'Invalid input!' if !(book_id.is_a? Integer) && book_id > @books.length

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i
    puts 'Invalide input!' if !(person_id.is_a? Integer) && person_id > @people.length

    print 'Please enter the date in this format [yyyy-mm-dd]: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @books[book_id], @people[person_id])
    @rentals << rental

    puts 'Rental created successfully'
    sleep 0.75
    @menu.option_list
  end

  def add_student
    print 'Enter the name of the student: '
    name = gets.chomp
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.to_s.downcase == 'y'
    student = Student.new(age, name, parent_permission: parent_permission)
    @people << student

    puts "Student with id #{student.id} successfully created"
  end

  def add_teacher
    print 'Enter the name of the teacher: '
    name = gets.chomp
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print "And teacher's specialization: "
    specilization = gets.chomp.to_s
    teacher = Teacher.new(specilization, age, name)
    @people << teacher

    puts "Teacher with id #{teacher.id} successfully created"
  end


  def exit
    puts 'Goodbye...'
  end
end
