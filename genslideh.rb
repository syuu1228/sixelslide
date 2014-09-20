#!/usr/bin/ruby

num_slides = Dir.glob("slide-*.png").count

puts "char *slide_start[#{num_slides}];"
puts "char *slide_end[#{num_slides}];"
puts "int num_slides;"
