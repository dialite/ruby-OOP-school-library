def add_student
  print 'Enter the name of the student: '
  name = gets.chomp
  print 'Enter the age of the student: '
  age = gets.chomp.to_i
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp.to_s.downcase == 'y'
  student = Student.new(age, name, parent_permission: parent_permission)
  @people << student

  puts "Student with id #{student.id} successfully created"
end