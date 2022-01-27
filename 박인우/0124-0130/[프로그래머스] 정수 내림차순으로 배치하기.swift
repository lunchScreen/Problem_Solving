func solution(_ n:Int64) -> Int64 {
    var number = n
    var nlist: [Int64] = []
    var answer: Int64 = 0
    var t: Int64 = 1
    
    while number != 0 {
        nlist.append(number % 10)
        number = number / 10
    }
    
    for n in nlist.sorted(by: <) {
        answer += n * t
        t *= 10
    }
    
    return answer
}

func solution(_ n:Int64) -> Int64 {
    return Int64(String(Array(String(n)).sorted(by: >)))!
}
