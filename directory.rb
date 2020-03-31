require 'csv'

@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  if @students.count > 0
    @students.each_with_index do |student, index|
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "There are no students"
  end
end

def print_footer
  @students.length > 1 ? plural = "s" : plural = ""
  puts "Overall, we have #{@students.count} great student#{plural}."
end

def input_students
  puts_multiple("---------------------","Please enter student information.", "To finish, just hit return twice.")
  while true do
    puts_multiple("--------------","Enter student name:")
    name = STDIN.gets.chomp
    break if name.empty?
    puts "Enter student cohort:"
    cohort = STDIN.gets.chomp
    cohort = :november if cohort.empty?
    add_student(name, cohort)
    puts_multiple("Student added.","There are now #{@students.count} students")
  end
end

def puts_multiple(*put_args)
  put_args.each { |arg| puts arg }
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def choose_save_file
  puts_multiple("---------------------", 
  "Please type the name of the file to save to.",
  "Or press return to load default")
  filename = STDIN.gets.chomp
  if filename.empty?
    save_students
  else
    save_students(filename)
  end
end

def save_students(filename = "students.csv")
  
  CSV.open(filename, "wb") do |csv_doc|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      csv_doc << csv_line.parse_csv
    end
  end
  puts "saved #{@students.count} to #{filename}"
end

def choose_load_file
  puts_multiple("---------------------", 
  "Please type the name of the file to load.",
  "Or press return to load default")
  filename = STDIN.gets.chomp
  if filename.empty?
    load_students
  else
    try_load_file(filename)
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student(name, cohort)
  end
  puts "loaded #{@students.count} from #{filename}"
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students
  else
    try_load_file(filename)
  end
end

def try_load_file(filename)
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def choose_student_letter
  puts_multiple("-----------------------",
  "Please type the first letter of names of students you wish to list.",
  "Will default to \"a\" if no input given")
  letter = STDIN.gets.chomp
  if letter.empty?
    print_students_by_letter
  else
    print_students_by_letter(letter)
  end
end

def print_students_by_letter(letter="a")
  @students.each do |student|
    if student[:name][0].downcase == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def choose_student_name_length
  puts_multiple("------------------",
  "Choose value to display student name lengths less than",
  "e.g. 5 will display all names less than 5 characters in length",
  "Defaults to \"10\"")
  name_length = STDIN.gets.chomp
  if name_length.empty?
    print_students_names_shorter_than_n
  else
    print_students_names_shorter_than_n(name_length.to_i)
  end
end

def print_students_names_shorter_than_n(name_length=10)
  @students.each do |student|
    if student[:name].length < name_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_students_by_cohort
  cohorts = Hash.new
  @students.each do |student|
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

def print_menu_options
  puts_multiple("-------------------------",
  "1: Input student information.",
  "2: Show student information.",
  "3: Save list of students.",
  "4: Load list of students.",
  "5: Search students by first name letter.",
  "6: Search students by name length.",
  "7: Display students ordered by cohort.",
  "8: Exit directory.")
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      choose_save_file
    when "4"
      choose_load_file
    when "5"
      choose_student_letter
    when "6"
      choose_student_name_length
    when "7"
      print_students_by_cohort
    when "9"
      exit
    else
      puts "Invalid option."
  end
end

#root management for user input
def interactive_menu
  loop do
    print_menu_options
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu