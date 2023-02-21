def create_book
  puts 'What is the title of the book: '
  title = gets.chomp
  puts 'What is the author of the book: '
  author = gets.chomp

  title_check = !title.empty? && title.is_a?(String)
  author_check = !author.empty? && author.is_a?(String)
  return puts 'Fill all options and age should be less than 18' unless title_check && author_check

  book = Book.new(title, author)
  @books << book
  puts 'Book created successfully'
  sleep 0.75
  @menu.option_list
end
