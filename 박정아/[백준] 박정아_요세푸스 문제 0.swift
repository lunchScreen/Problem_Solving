solution()

func solution() {
    let input = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) }
    guard let n = input[0], let k = input[1] else { return }
    var seats = Array(1...n)
    var index = k - 1
    var josephus: [Int] = []
    
    while !seats.isEmpty {
        index %= seats.count
        josephus.append(seats.remove(at: index))
        index += k - 1
    }
    
    print("<\(josephus.map{ String($0) }.joined(separator: ", "))>")
}
