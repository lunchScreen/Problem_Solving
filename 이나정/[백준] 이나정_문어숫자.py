octopusNumber = ['-', '\\', '(', '@', '?', '>', '&', '%']
octopusMinus = '/'

inputStr = input()

while(inputStr != "#"):
    answer = 0
    for idx, s in enumerate(inputStr):
        if s == octopusMinus:
            answer -= pow(8, len(inputStr) - idx - 1)
        else:
            answer += octopusNumber.index(s) * pow(8, len(inputStr) - idx - 1)
    print(answer)
    inputStr = input()
