func solution(_ x:Int) -> Bool {
    var sum = String(x)
        .reduce(0, {
            $0 + Int(String($1))!
        })        

    return x % sum == 0
}

func solution(_ x:Int) -> Bool {
    var a: Int = 0
    var b: Int = x
    while b != 0 {
        a += b % 10
        b = b / 10
    }
    return x % a == 0
}
