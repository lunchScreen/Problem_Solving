func solution(_ n:Int, _ m:Int) -> [Int] {
    var a = n > m ? n : m
    var b = n > m ? m : n
    
    while a % b != 0 {
        let temp = a
        a = b
        b = temp % b
    }
    
    return [b, Int(n*m/b)]
}

// a, b에 대해서 a를 b로 나눈 나머지를 r이라 하면(단, a>b), a와 b의 최대공약수는 b와 r의 최대공약수와 같다.
// 최소공배수는 두수의 곱에서 최대공약수를 나눠서 구함
