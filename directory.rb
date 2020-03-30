students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :june},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :june},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :june},
  {name: "Norman Bates", cohort: :november}
]

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november} 
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students)
  if students.count > 0
    students.each_with_index do |student, index|
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "There are no students"
  end
end

def print_students_by_letter(students, letter)
  students.each do |student|
    if student[:name][0] == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_students_names_shorter_than_n(students, name_length)
  students.each do |student|
    if student[:name].length < name_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_students_by_cohort(students)
  
  cohorts = Hash.new
  
  students.each do |student|
    if cohorts.has_key?(student[:cohort])
      cohorts[student[:cohort]] << student[:name]
    else
      cohorts[student[:cohort]] = [student[:name]]
    end
  end
  
  cohorts.each do |key, value|
    
    puts "#{key} cohort students:"
    
    value.each do |student|
      puts "#{student}"
    end
    
    puts "----------------------------"
    
  end
  
end

def print_footer(names)
  names.length > 1 ? plural = "s" : plural = ""
  puts "Overall, we have #{names.count} great student#{plural}."
end

def input_students(students)
  puts "Please enter student information."
  puts "to finish, just hit return twice."
  
  #students = []
  
  while true do
    
    puts "Enter student name:"
    name = gets.chomp
    
    break if name.empty?
    
    puts "Enter student cohort:"
    cohort = gets.chomp
    cohort = :november if cohort.empty?
    
    students << { name: name, cohort: cohort.to_sym }
    puts "There are now #{students.count} students"
    
  end
  
  return students
  
end

#root management for user input
def interactive_menu
  
  students = []
  
  loop do
    puts "1: Input student information."
    puts "2: Show student information."
    puts "3: Exit directory."
    
    user_selection = gets.chomp
    
    case user_selection
      when "1"
        students = input_students(students)
      when "2"
        print_header
        print_students(students)
        print_footer(students)
      when "3"
        exit
      else
        puts "Invalid option."
    end
  end
end



#students = input_students
interactive_menu

#print_students(students)

#print_students_by_letter(students, "j")
#print_students_names_shorter_than_n(students, 12)

#print_header
#print(students)
#print_footer(students)