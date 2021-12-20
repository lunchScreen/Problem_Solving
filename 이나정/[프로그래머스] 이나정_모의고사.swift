import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var correct: [Int] = [0, 0, 0]
    var student = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]
    
    for (idx, x) in answers.enumerated() {
        for i in 0..<student.count {
            if student[i][idx % student[i].count] == x {
                correct[i] += 1
            }
        }
    }
    var answer: [Int] = []
    for (idx, x) in correct.enumerated(){
        if correct.max() == x {
            answer.append(idx+1)
        }
    }
    return answer
}
