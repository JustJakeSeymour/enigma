
filepath_read   = ARGV[0].to_s
filepath_write  = ARGV[1].to_s
key   = ARGV[2].to_s if !ARGV.nil?
date  = ARGV[3].to_s if !ARGV.nil?

enigma = Enigma.new(filepath_read, filepath_write, key, date)
enigma.encrypt(enigma.read_file_to_string, enigma.key, enigma.date)