import Foundation

func solution(_ s:String) -> Int {
    let numbers = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    var result = s
    
    numbers.enumerated().forEach { num, word in
        result = result.replacingOccurrences(of: word, with: "\(num)")
    }
    
    return Int(result) ?? 0
}
