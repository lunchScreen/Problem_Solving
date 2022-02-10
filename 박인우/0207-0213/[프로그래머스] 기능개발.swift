import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var answer: [Int] = []
    var copyProgresses = progresses
    var copySpeeds = speeds
    
    while copyProgresses.count > 0 {
        var end  = 0
        for i in 0..<copyProgresses.count {
            copyProgresses[i] += copySpeeds[i]
        }
        while copyProgresses.count > 0 && copyProgresses[0] >= 100 {
            copyProgresses.removeFirst()
            copySpeeds.removeFirst()
            end += 1
        }
        if end > 0 {
            answer.append(end)
        }
    }
    
    return answer
}
