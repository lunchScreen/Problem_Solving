import re
from collections import Counter

def solution(s):
    s_list = Counter(re.findall(r'\d+', s)).most_common()
    return [ int(k) for k, v in s_list ]