require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/enigma'

filepath_read   = ARGV[0].to_s
filepath_write  = ARGV[1].to_s
key   = ARGV[2] if !ARGV[2].nil?
date  = ARGV[3] if !ARGV[3].nil?

enigma = Enigma.new(filepath_read, filepath_write, key, date)
enigma.encrypt(enigma.read_file_to_string, enigma.key, enigma.date)

puts "Created #{filepath_write} with the key #{enigma.key} and the date #{enigma.date}"