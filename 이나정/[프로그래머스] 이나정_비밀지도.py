def dec2Bin(num, leng):
    str = ""
    for _ in range(leng):
        str = "#" + str if (num % 2 == 1) else " " + str
        num = int(num/2)
    return str

def solution(n, arr1, arr2):
    answer = []
    for i in range(n):
        str = ""
        row1, row2 = dec2Bin(arr1[i], n), dec2Bin(arr2[i], n)
        for j in range(n):
            str += " " if (row1[j] == " " and row2[j] == " ") else "#"
        answer.append(str)
    return answer
