require 'json'

class LoadData
  def self.load_books
    file_path = './src/data/books.json'
    books = []

    # Create an empty array and write it to a file if it doesn't exist
    File.write(file_path, [].to_json) unless File.exist?(file_path)

    # Parse the file directly into an array of hashes
    records = JSON.parse(File.read(file_path))

    # Iterate through the array of hashes and find books with each record and adds book to books
    records.each do |record|
      books << Book.new(record['title'], record['author'])
    end

    books
  end

  def self.load_people
    people = []
    filepath = './src/data/people.json'

    # Create an empty array and write it to a file if it doesn't exist
    File.write(filepath, []) unless File.exist?(filepath)

    # Parse the file directly into an array of hashes
    records = JSON.parse(File.read(filepath))

    # Iterate through the array of hashes and find person with each record and adds person to people
    records.each do |record|
      person = if record['type'] == 'Student'
                 Student.new(record['age'],
                             nil,
                             record['name'],
                             parent_permission: record['parent_permission'])
               else
                 Teacher.new(record['age'], '', record['name'])
               end
      person.id = record['id']
      people.push(person)
    end
    people
  end

  def self.load_rentals(books, people)
    rentals = []
    filepath = './src/data/rentals.json'

    # Create an empty array and write it to a file if it doesn't exist
    File.write(filepath, '[]') unless File.exist?(filepath)

    # Parse the file directly into an array of hashes
    records = JSON.parse(File.read(filepath), symbolize_names: true)

    # Iterate through the array of hashes and find the book and person associated with each record
    records.each do |record|
      book = books.find { |b| b.title == record[:title] }
      person = people.find { |p| p.id == record[:person_id] }

      # Check if both book and person are found, and then add the rental
      if book && person
        rental = person.add_rental(record[:date], book)
        rentals << rental
      end
    end

    # Return the array of rentals
    rentals
  end
end
