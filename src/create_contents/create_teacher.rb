def add_teacher
  print 'Enter the name of the teacher: '
  name = gets.chomp.to_s
  print 'Enter the age of the teacher: '
  age = gets.chomp.to_i
  print "And teacher's specialization: "
  specialization = gets.chomp.to_s

  name_check = !name.empty? && name.is_a?(String)
  age_check = age >= 18 && age.is_a?(Integer)
  specialization_check = !specialization.empty? && specialization.is_a?(String)
  return puts 'Fill all options and age should be equal or more than 18' unless name_check && age_check && specialization_check

  teacher = Teacher.new(specialization, age, name)
  @people << teacher

  puts "Teacher with id #{teacher.id} successfully created"
end
