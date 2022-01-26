func solution(_ num:Int) -> Int {
    var a = num
    var count = 0
    while a != 1 {
        if a % 2 == 0 {
            a = a / 2 
        } else {
            a = a * 3 + 1
        }
        count += 1
        if count == 500 {
            return -1
        }
    }
    return count
}
