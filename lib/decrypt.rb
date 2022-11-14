require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/enigma'

filepath_read   = ARGV[0].to_s
filepath_write  = ARGV[1].to_s
key   = ARGV[2]
date  = ARGV[3]

enigma = Enigma.new(filepath_read, filepath_write, key, date)
enigma.decrypt(enigma.read_file_to_string, enigma.key, enigma.date)

puts "Created #{filepath_write} with the key #{enigma.key} and the date #{enigma.date}"
