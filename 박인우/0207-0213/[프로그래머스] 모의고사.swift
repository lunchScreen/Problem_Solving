import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var score = [0, 0, 0]
    let one = [1, 2, 3, 4, 5]
    let two = [2, 1, 2, 3, 2, 4, 2, 5]
    let three = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    for (idx, answer) in answers.enumerated() {
        if answer == one[idx % one.count] {
            score[0] += 1
        }
        
        if answer == two[idx % two.count] {
            score[1] += 1
        }
        
        if answer == three[idx % three.count] {
            score[2] += 1
        }
    }
    
    let maxValue = score.max()!
    
    return score.enumerated().filter {
        $0.element == maxValue
    }.map {
        $0.offset + 1
    }
}
