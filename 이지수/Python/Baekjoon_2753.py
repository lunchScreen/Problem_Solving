import sys
y = int(sys.stdin.readline())
print(1 if (y % 100 and not y % 4) or not y % 400 else 0)
