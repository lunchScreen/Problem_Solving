func solution() {
    let input = (readLine() ?? "").split(separator: " ").map{ Int($0) ?? 0 }
    let sequence = (readLine() ?? "").split(separator: " ").map{ Int($0) ?? 0 }
    let x = input[1]
    
    sequence.forEach { number in
        if number < x {
            print(number, terminator: " ")
        }
    }
}

solution()
