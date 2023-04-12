import sys

s = [x for y in [s.split() for s in open(sys.argv[1]).read().split('\n')]
       for x in y]

print(s)


