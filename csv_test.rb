require 'csv'

#array_of_a = CSV.read("students.csv")

#print array_of_a

#csv_data = ["some,data", "more,data"]

=begin
CSV.parse(csv_data) do |row|
    puts "here"
    print row
end
=end

#csv_array = CSV.parse(csv_data)
#print csv_array

CSV.open("csv_dtt_2.csv", "wb") do |csv|
    csv << ["data", "for", "csv"]
    csv << ["more", "data"]
end

=begin
CSV.foreach("students.csv") do |row|
    print row
end
=end