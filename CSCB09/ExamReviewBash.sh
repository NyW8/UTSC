$ sort [options] unsorted.txt
	'''
	sorts unsorted.txt alphabetically separated by whitespace 10 1 100 9 -> 1 10 100 9 
	options:
	-t val	uses 'val' as divider
	-r		sorts in reverse order (largest to smallest)
	-n		numeric sort 10 1 100 9 -> 1 9 10 100
	-k m,n  uses columns m to n as one key to sort by 
	'''

$ sort unsorted.txt | tee [options] file.txt
	'''
	writes the output to stdout and writes the same information to file.txt
	options: 
	-a 		appends to file.txt
	'''


$ tr [options] set1 set2 < file.txt
	'''
	finds and replaces characters in set1 with characters in set2
	options:
	-c 		replace characters not found in set1 with characters in set2 (complement of set1 is replaced)
	-d 		delete characters found in set1
	-s 		replace consecutive occurences with single occurence (squeeze) 
	examples:
	tr a-z A-Z
	tr [:lower:] [:upper:]
	tr -cs 1234 '[a*]'		#replace everything but 1234 with 'a', then squeeze 'a's
	tr -cs 0-9a-z '[\n*]'	#replace everything but 0-9a-z with '\n' theb squeeze '\n'
	tr -ds 12 3				#remove 12, then squeeze 3
	'''

$ ln [option] target link_name
	'''
	creates a hard/soft link to the target. Hard link creates a new path directly to the file (same inode number as original)
	options:
	-s 		soft link, creates a file that holds the location of the file. When opened, opens from original file location
	'''

$ basename pathname
	'''
	sends the part of the pathname after the last '\' to stdout
	'''

$ dirname pathname
	'''
	sends the part of the pathname before the last '\' to stdout (including trailing '\\\\'s), or if none, sends '.' (current directory)
	'''