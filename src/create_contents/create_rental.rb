def create_rental
  puts 'There are no books and person yet! Kindly add books and a person.' if @books.empty? || @people.empty?
  @menu.option_list
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