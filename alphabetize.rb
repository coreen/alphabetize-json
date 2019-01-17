#!/usr/bin/env ruby

# Coreen Yuen
# Alphabetizes json file such that keys are in sorted order.

# Usage: ./alphabetize.rb <inputFilepath> <outputFilepath>

require 'json'

supported_file_extensions = Array['.json']

# Check that 2 input arguments are provided
if ARGV.length < 2
	puts 'ERROR: 2 input arguments are required to execute script'
	puts "\nUsage: ./alphabetize.rb <inputFilepath> <outputFilepath>"
	exit(false)
end

input_filepath = ARGV[0]
output_filepath = ARGV[1]

# Check that file extensions are .json only
unless supported_file_extensions.include? File.extname(input_filepath) and supported_file_extensions.include? File.extname(output_filepath)
	puts 'ERROR: only supported file extensions are: ' + supported_file_extensions.join(', ')
	exit(false)
end


def object_sort (level, object, output_file)
	sorted_keys = object.keys.sort_by(&:upcase)
	for i in 0..(sorted_keys.length - 1)
		key = sorted_keys[i]
		val = object[key]

		# create necessary spacing for this level
		line = ''
		if i > 0
			line += ",\n"
		end
		for j in 0..(level - 1)
			line += "\t"
		end
		if val.is_a?(String)
			# regular print
			line += "\"" + key + "\": \"" + val + "\""
			output_file.write(line)
		else
			# subobject, recurse
			start = line + "\"" + key + "\": {\n"
			output_file.write(start)
			object_sort(level + 1, val, output_file)
			finish = "\n" + line + '}'
			output_file.write(finish)
		end
	end
end


input_file = File.read(input_filepath)
data_hash = JSON.parse(input_file)

# Write sorted result to another file
output_file = File.new(output_filepath, 'w')
# Using double quotes to evaluate special characters
output_file.write("{\n")

object_sort(1, data_hash, output_file)

output_file.write("\n}")
output_file.close

exit(true)
