func solution(_ n:Int) -> Int {
    var answer: Int = 0
    var sqrt: Int = Int(Double(n).squareRoot())
    
    if n == 0 { return 0 }
    
    for i in 1...sqrt {
        if n % i == 0 {
            answer += i
            if i != n / i {
                answer += n / i                
            }
        }
    }    
    
    return answer
}

func solution(_ n:Int) -> Int {   
    guard n != 0 else {
        return 0
    }
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}
