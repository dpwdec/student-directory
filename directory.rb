students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)".center(100)
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

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

def input_students
  puts "Please enter student information."
  puts "to finish, just hit return twice."
  
  students = []
  
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

students = input_students

#print_students_by_letter(students, "j")
#print_students_names_shorter_than_n(students, 12)

#print_header
print(students)
#print_footer(students)