def add_student
  print 'Enter the name of the student: '
  name = gets.chomp.to_s
  print 'Enter the age of the student: '
  age = gets.chomp.to_i
  print 'Has parent permission? [Y/N]: '
  parent_permission = gets.chomp.to_s.downcase == 'y'

  name_check = !name.empty? && name.is_a?(String)
  age_check = age < 18 && age.is_a?(Integer)
  parent_permission_check = parent_permission.is_a?(String)
  return puts 'Fill all options and age should be less than 18' unless name_check && age_check && parent_permission_check

  student = Student.new(age, name, parent_permission: parent_permission)
  @people << student

  puts "Student with id #{student.id} successfully created"
end
