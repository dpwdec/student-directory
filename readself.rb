# This program should read and output itself.

File.foreach(File.basename(__FILE__)) do |line|
    puts line
end