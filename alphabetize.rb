#!/usr/bin/env ruby

# Coreen Yuen
# Alphabetizes json file such that keys are in sorted order.

# Usage: ./alphabetize.rb <inputFilepath> <outputFilepath>

require 'json'

supported_file_extensions = Array['.json']

input_filepath = ARGV[0]
output_filepath = ARGV[1]

# Check that file extensions are .json only
unless supported_file_extensions.include? File.extname(input_filepath) and supported_file_extensions.include? File.extname(output_filepath)
	puts 'ERROR: only supported file extensions are: ' + supported_file_extensions.join(', ')
	exit(false)
end

input_file = File.read(input_filepath)
data_hash = JSON.parse(input_file)

# Write sorted result to another file
output_file = File.new(output_filepath, 'w')
# Using double quotes to evaluate special characters
output_file.write("{\n")
data_hash.keys.sort.each do |key|
	val = data_hash[key]
	output_file.write("\t\"" + key + "\": " + val + "\",\n")
end
output_file.write("}")
output_file.close

exit(true)
