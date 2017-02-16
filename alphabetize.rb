# Coreen Yuen
# Alphabetizes json file such that keys are in sorted order.

require 'json'

input_file = File.read('input.json')
data_hash = JSON.parse(input_file)

# Write sorted result to another file
output_file = File.new('actual.json', 'w')
output_file.write('{\n')
data_hash.keys.sort.each do |key|
	val = data_hash[key]
	output_file.write('\t' + key + ': ' + val + ',\n')
end
output_file.write('}')
output_file.close
