import sys
import itertools
input = sys.stdin.readline

def available(words, chars) :
    count = 0
    for word in words :
        if avail(word, chars) : count += 1
    return count

def avail(word, chars):
    for char in word : 
        if char not in chars : return False
    return True

def solution(n, k, words, needs): 
    if k < 0 : return 0
    answer = 0
    for chars in itertools.combinations(needs, min(max(k, 0), len(needs))) :
        answer = max(available(words, chars), answer)
    return answer

def start() :
    n, k = map(int, input().split())
    words = []
    for _ in range(n) :
        word = input().rstrip()[4:-4]
        words.append(list(set([ord(char) - 97 for char in list(word) if char not in ["a","n","t","i","c"]])))
    print(solution(n, k-5, words, list(set(sum(words,[])))))

start()
