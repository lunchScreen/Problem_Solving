def solution(string) :
    while len(string) :
        num = 0
        if string[0] == "0" :
            if len(string) < 2 or string[0:2] != "01": return False
            string = string[2:]
        else :
            if len(string) < 4 or string[0:3] != "100" : return False
            string = string[3:]
            while string[0] == "0":
                if len(string) == 1 : return False
                string = string[1:]
            while string[0] == "1":
                num += 1
                if len(string) > 1: string = string[1:]
                else : string = ""; break
            if num > 1 and string[0:2] == "00" : string = "1" + string
    return True

t = int(input())
for _ in range(t) :
    string = input()
    print("YES" if solution(string) else "NO")
