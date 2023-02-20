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

  def list_all_books(show_index: false)
    puts 'There are no books yet! Kindly add books.' if @books.empty?

    @books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"
      result = " #{index}) " + result if show_index
      puts result
    end
    sleep 0.75
    @menu.option_list
  end

  def list_all_people(show_index: false)
    puts 'There is nobody yet! Kindly add a student or a teacher.' if @people.empty?

    @people.each_with_index do |person, index|
      result = "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result if show_index
      puts result
    end
    sleep 0.75
    @menu.option_list
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Invalid input' if type != 1 && type != 2
    add_student if type == 1
    add_teacher if type == 2
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

  def create_book
    puts 'What is the title of the book: '
    title = gets.chomp
    puts 'What is the author of the book: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
    sleep 0.75
    @menu.option_list
  end

  def exit
    puts 'Goodbye...'
  end
end
