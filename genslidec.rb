#!/usr/bin/ruby

num_slides = Dir.glob("slide-*.png").count

(0...num_slides).each do |i|
    puts "extern int _binary_slide_#{i}_txt_start;"
    puts "extern int _binary_slide_#{i}_txt_end;"
end
puts "char *slide_start[] = {"
(0...num_slides).each do |i|
    puts "(char *)&_binary_slide_#{i}_txt_start,"
end
puts "};"
puts "char *slide_end[] = {"
(0...num_slides).each do |i|
    puts "(char *)&_binary_slide_#{i}_txt_end,"
end
puts "};"
puts "int num_slides = #{num_slides};"
