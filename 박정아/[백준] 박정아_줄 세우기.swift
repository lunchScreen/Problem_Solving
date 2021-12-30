import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let n = input[0]
    let m = input[1]
    var graph = Array(repeating: Array(repeating: 0, count: 0), count: n + 1)
    var degree = Array(repeating: 0, count: n + 1)
    var queue = [Int]()
    var answer = [Int]()
    
    for _ in 0..<m {
        let students = readLine()!.split(separator: " ").map{ Int(String($0))! }
        graph[students[0]].append(students[1])
        degree[students[1]] += 1
    }
    
    degree.enumerated().forEach { student, count in
        if student != 0 && count == 0 {
            queue.append(student)
        }
    }
    
    while !queue.isEmpty {
        let student = queue.removeFirst()
        answer.append(student)
        
        graph[student].forEach { nextStudent in
            degree[nextStudent] -= 1
            if degree[nextStudent] == 0 {
                queue.append(nextStudent)
            }
        }
    }
    
    answer.forEach { number in
        print(number, terminator: " ")
    }
}

solution()
 
