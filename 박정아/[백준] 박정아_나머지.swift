import Foundation

func solution() {
    var set = Set<Int>()
    
    for _ in 0..<10 {
        set.insert(Int(readLine()!)! % 42)
    }
    
    print(set.count)
}

solution()

