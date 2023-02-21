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
