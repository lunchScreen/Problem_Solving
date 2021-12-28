import Foundation

func solution() {
    let n = Double(readLine()!)!
    var grades = (readLine()!).split(separator: " ").map{ Double(String($0))! }
    let max = grades.max()!
    
    for (i, grade) in grades.enumerated() {
        grades[i] = grade / max * 100
    }
    
    print(grades.reduce(0, +) / n)
}

solution()

