require 'json'

class SaveData
  def self.save(books, persons, rentals)
    save_books(books)
    save_people(persons)
    save_rentals(rentals)
  end

  def self.save_books(books)
    File.write('./src/data/books.json', []) unless File.exist?('./src/data/books.json')
    records = []
    books.each { |book| records.push({ title: book.title, author: book.author }) }
    File.write('./src/data/books.json', JSON.generate(records))
  end

  def self.save_people(people)
    File.write('./src/data/people.json', []) unless File.exist?('./src/data/people.json')
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
    File.write('./src/data/people.json', JSON.generate(records))
  end

  def self.save_rentals(rentals)
    File.write('./src/data/rentals.json', []) unless File.exist?('./src/data/rentals.json')
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
    File.write('./src/data/rentals.json', JSON.generate(records))
  end
end
