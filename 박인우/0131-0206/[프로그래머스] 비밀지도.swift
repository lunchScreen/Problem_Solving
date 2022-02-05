// 방법 1
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for idx in 0..<n {
        var str = String(arr1[idx] | arr2[idx], radix: 2)
        str = String(repeating: "0", count: n-str.count) + str
        str = str.replacingOccurrences(of: "0", with: " ")
        str = str.replacingOccurrences(of: "1", with: "#")
        answer.append(str)
    }
    return answer
}

// 방법 2
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for idx in 0..<n {
        var str = String(arr1[idx] | arr2[idx] | 2 << (n - 1), radix: 2)
        str = str.replacingOccurrences(of: "0", with: " ")
        str = str.replacingOccurrences(of: "1", with: "#")
        answer.append(String(str.suffix(n)))
    }
    return answer
}

// 방법 3
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    for idx in 0..<n {
        var str = String(arr1[idx] | arr2[idx], radix: 2)
        str = String(repeating: "0", count: n-str.count) + str
        str = String(str.map { $0 == "1" ? "#" : " " })
        answer.append(str)
    }
    return answer
}

// 방법 4
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map {
        String(String(arr1[$0] | arr2[$0] | 2 << (n - 1), radix: 2).map {
            $0 == "1" ? "#" : " "
        }[1...n])
    }
}
