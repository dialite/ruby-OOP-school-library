def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    puts 'Invalid input' if type != 1 && type != 2
    add_student if type == 1
    add_teacher if type == 2
    sleep 0.75
    @menu.option_list
  end