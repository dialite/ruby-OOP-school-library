# Used to select user input choice
class Logic
  def self.find(parent, key)
    parent.find { |element| element.id == key }
  end
end
