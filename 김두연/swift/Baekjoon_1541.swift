func baekjoon1541() {
    let temp = readLine()!.split(separator: "-").map { String($0) }
    var result = 0
    
    for i in 0..<temp.count {
        let n = temp[i].split(separator: "+").map { Int(String($0))! }
        let sum = n.reduce(0, +)
        
        if i == 0 {
            result += sum
        } else {
            result -= sum
        }
    }
    
    print(result)
}

//baekjoon1541()
