import Foundation

func solution() {
    let c = Int(readLine()!)!
    
    for _ in 0..<c {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = input[0]
        let average = input[1...n].reduce(0, +) / n
        let count = input[1...n].filter{ average < $0 }.count
        print("\(String(format: "%.3f", Double(count) / Double(n) * 100))%")
    }
}

solution()

 
