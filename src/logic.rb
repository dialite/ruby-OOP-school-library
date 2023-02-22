# Used to select user input choice
class Logic
    def self.find(parent, key)
      parent.each do |element|
        return element if element.id == key
      end
    end
  end