require 'json'

class SaveData
  def self.save(books, persons, rentals)
    save_books(books)
    save_people(persons)
    save_rentals(rentals)
  end

  # saves book created to JSON
  def self.save_books(books)
    filepath = './src/data/books.json'

    File.write(filepath, []) unless File.exist?(filepath)
    records = []
    books.each { |book| records.push({ title: book.title, author: book.author }) }
    File.write(filepath, JSON.generate(records))
  end

  # saves person (student and teacher) created to JSON
  def self.save_people(people)
    filepath = './src/data/people.json'

    File.write(filepath, []) unless File.exist?(filepath)
    records = []
    people.each do |person|
      records << {
        id: person.id,
        type: person.class,
        name: person.name,
        age: person.age,
        parent_permission: person.can_use_services?
      }
    end
    File.write(filepath, JSON.generate(records))
  end

  # saves rentals created to JSON
  def self.save_rentals(rentals)
    filepath = './src/data/rentals.json'

    File.write(filepath, []) unless File.exist?(filepath)
    records = []
    rentals.each do |rental|
      records << {
        date: rental.date,
        person_id: rental.person.id,
        person_name: rental.person.name,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write(filepath, JSON.generate(records))
  end
end
