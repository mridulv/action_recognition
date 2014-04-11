import re
import os

ins = open( "file_train.txt", "r" )
ins = ins.readlines()
val = 0
for line in ins:
    words = line.strip().split('<')
    # print words
    i = iter(words)
    p = i.next()
    p = i.next()
    if p.split('>')[0] == 'HandShake':
    	new_words = line.strip().split('"')
    	i = iter(new_words)
    	p = i.next()
    	val = val + 1
    	p = i.next()

    	new_words_2 = line.strip().split('(')
    	i_2 = iter(new_words)
    	p_2 = i_2.next()
    	p = i.next()

    	dir_1 = 'videoclips2/'
    	dir_2 = dir_1
    	dir_1 += p
    	dir_2 += str(val)
    	dir_2 += '.avi'
    	print dir_1
    	print 'ass'
    	print dir_2
    	# os.rename(dir_1,dir_2)
print val

