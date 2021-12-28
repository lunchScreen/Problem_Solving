def solution(s):
    answer = 0
    p = 0
    case = ["ze", "on", "tw", "th", "fo", "fi", "si", "se", "ei", "ni"]
    nums = [3, 2, 2, 4, 3, 3, 2, 4, 4, 3]
    for (i, c) in enumerate(list(s)) :
        if p > 0 : p-=1; continue
        num = ord(c)
        if 48 <= num <= 57 : num = int(c)
        else :
            index = case.index(c+s[i+1])
            num = index; p=nums[index]
        answer = answer*10+num
    return answer
