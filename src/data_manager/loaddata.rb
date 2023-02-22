require 'json'

class LoadData
  def self.load_books
    books = []
    File.write('./src/data/books.json', []) unless File.exist?('./src/data/books.json')
    records = JSON.parse(File.read('./src/data/books.json'))
    records.each { |record| books.push(Book.new(record['title'], record['author'])) }
    books
  end

  def self.load_people
    people = []
    File.write('./src/data/people.json', []) unless File.exist?('./src/data/people.json')
    records = JSON.parse(File.read('./src/data/people.json'))
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
    File.write('./src/data/rentals.json', []) unless File.exist?('./src/data/rentals.json')
    records = JSON.parse(File.read('./src/data/rentals.json'))
    records.each do |record|
      book = books.select { |b| b.title == record['title'] }[0]
      person = people.select { |p| p.id == record['person_id'] }[0]
      rental = person.add_rental(record['date'], book)
      rentals.push(rental)
    end
    rentals
  end
end
