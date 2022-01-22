import Foundation

func baekjoon2470() {
    let n = Int(readLine()!)!
    var potions = readLine()!.split(separator: " ").map { Int(String($0))! }
    potions.sort()
    
    var left = 0
    var right = potions.count - 1
    var min = abs(potions.first! + potions.last!)
    var answer = (potions.first!, potions.last!)
    
    while left < right {
        let sum = potions[left] + potions[right]
        
        if min > abs(sum) {
            min = abs(sum)
            answer.0 = potions[left]
            answer.1 = potions[right]
        }
        
        if sum == 0 {
            break
        } else if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
    
    print(answer.0, answer.1)
}

//baekjoon2470()
