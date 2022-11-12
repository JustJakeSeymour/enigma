

enigma = Enigma.new(filepath_read, filepath_write, key, date)
enigma.decrypt(enigma.read_file_to_string, enigma.key, enigma.date)