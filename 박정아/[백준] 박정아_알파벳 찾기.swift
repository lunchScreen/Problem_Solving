import Foundation

func solution() {
    let input = Array(readLine() ?? "").map{ String($0) }
    var result = Array(repeating: -1, count: 26)
    
    for (i, char) in input.enumerated().reversed() {
        result[Int(Character(char).asciiValue!) - 97] = i
    }
    
    result.forEach { count in
        print(count, terminator: " ")
    }
}

solution()

