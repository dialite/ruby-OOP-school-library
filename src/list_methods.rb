require_relative './logic'

class ListMethods
def self.list_people(people)
    puts 'There is nobody yet! Kindly add a student or a teacher.' if people.empty?
    puts
    people.each_with_index do |person, index|
      result = "[#{person.class}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
      result = "#{index}) " + result
      puts result
    end
    sleep 0.75
  end

  def self.list_books(books)
    puts 'There are no books yet! Kindly add books.' if books.empty?
    puts
    books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"
      result = " [#{index}] " + result
      puts result
    end
    sleep 0.75
  end

    def self.list_rentals(people)
        puts 'No person entry found' if people.empty?
        puts
        puts 'Enter person ID: '
        person_id = gets.chomp.to_i
        person = Logic.find(people, person_id)
        puts 'Rentals:'
        person.rentals.each do |rental|
          puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
        end
      end
end