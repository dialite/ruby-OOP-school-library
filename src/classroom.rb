class Classroom
  attr_accessor :label
  attr_reader :student

  def initialize(label)
    @label = label
    @students = []
  end

  # assign student to a classroom
  def assign_students(student)
    @students.push(student)
    student.classroom = self
  end
end
