def solution(str1, str2):
    new_str1 = [str1[i:i + 2].lower() for i in range(len(str1) - 1) if str1[i:i + 2].isalpha()]
    new_str2 = [str2[i:i + 2].lower() for i in range(len(str2) - 1) if str2[i:i + 2].isalpha()]

    total = set(new_str1) | set(new_str2)

    set_sum = []
    set_inter = []
    if total:
        for i in total:
            set_sum.extend([i] * max(new_str1.count(i), new_str2.count(i)))
            set_inter.extend([i] * min(new_str1.count(i), new_str2.count(i)))
        return int(len(set_inter) / len(set_sum) * 65536)
    else:
        return 65536