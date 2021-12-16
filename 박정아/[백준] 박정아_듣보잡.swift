func solution() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let n = input[0]
    let m = input[1]
    var nArr = Set<String>()
    var resultArr = [String]()
    
    for _ in 0..<n {
        nArr.insert(readLine()!)
    }
    
    for _ in 0..<m {
        let name = readLine()!
        if nArr.contains(name) {
            resultArr.append(name)
        }
    }
    
    resultArr.sort()
    print(resultArr.count)
    
    resultArr.forEach { name in
        print(name)
    }
}

solution()

