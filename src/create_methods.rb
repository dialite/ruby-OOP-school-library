require_relative './book'
require_relative './list_methods'
require_relative './student'
require_relative './teacher'

class CreateMethods
  def self.create_book(books)
    puts
    puts 'What is the title of the book: '
    title = gets.chomp
    puts 'What is the author of the book: '
    author = gets.chomp

    title_check = !title.empty? && title.is_a?(String)
    author_check = !author.empty? && author.is_a?(String)
    return puts 'Fill all options and age should be less than 18' unless title_check && author_check

    book = Book.new(title, author)
    books << book
    puts
    puts 'Book created successfully'
    puts
    sleep 0.75
  end

  def self.create_student(people)
    print 'Enter the name of the student: '
    name = gets.chomp
    print 'Enter the age of the student: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    case parent_permission
    when 'y'
      parent_permission = true
    when 'n'
      parent_permission = false
    end
    name_check = !name.empty? && name.is_a?(String)
    age_check = age < 18 && age.is_a?(Integer)
    return puts 'Fill all options and age should be less than 18' unless name_check && age_check

    student = Student.new(age, nil, name, parent_permission: parent_permission)
    people << student
    puts "Student with id #{student.id} successfully created"
    puts
  end

  def self.create_teacher(people)
    print 'Enter the name of the teacher: '
    name = gets.chomp.to_s
    print 'Enter the age of the teacher: '
    age = gets.chomp.to_i
    print "And teacher's specialization: "
    specialization = gets.chomp.to_s

    name_check = !name.empty? && name.is_a?(String)
    age_check = age >= 18 && age.is_a?(Integer)
    specialization_check = !specialization.empty? && specialization.is_a?(String)
    unless name_check && age_check && specialization_check
      return puts 'Fill all options and age should be equal or more than 18'
    end

    teacher = Teacher.new(age, specialization, name)
    people << teacher
    puts
    puts "Teacher with id #{teacher.id} successfully created"
    puts
  end

  # rubocop:disable Metrics/MethodLength
  def self.create_rental(people, books, rentals)
    puts 'There are no books and person yet! Kindly add books and a person.' if books.empty?
    puts 'Select a book from the following list by number'
    ListMethods.list_books(books)
    book_choice = gets.chomp.to_i
    while book_choice.negative? || book_choice >= books.length
      print "Please enter a number within 0 - #{books.length - 1} range: "
      book_choice = gets.chomp.to_i
    end
    book = books[book_choice]
    puts 'Select a person from the following list by number (not id)'
    ListMethods.list_people(people)
    person_choice = gets.chomp.to_i
    while person_choice.negative? || person_choice >= people.length
      print "Please enter a number within 0 - #{people.length - 1} range: "
      person_choice = gets.chomp.to_i
    end
    person = people[person_choice]
    print 'Please enter the date in this format [yyyy-mm-dd]: '
    date = gets.chomp.strip
    rentals << person.add_rental(date, book)
    puts 'Rental created successfully'
    sleep 0.75
  end
  # rubocop:enable Metrics/MethodLength
end
