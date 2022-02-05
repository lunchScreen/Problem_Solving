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
