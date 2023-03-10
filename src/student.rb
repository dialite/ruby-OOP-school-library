require_relative './person'
require_relative './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'unkwon', parent_permission: true)
    super(age, parent_permission: parent_permission)
    @name = name
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  # assign classroom to students
  def assign_classroom(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
