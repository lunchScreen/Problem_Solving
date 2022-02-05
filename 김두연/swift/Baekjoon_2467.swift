import Foundation

func baekjoon2467() {
    let n = Int(readLine()!)!
    var potions = readLine()!.split(separator: " ").map { Int(String($0))! }
    potions.sort()
    
    var left = 0
    var right = potions.count - 1
    
    var minValue = abs(potions[left] + potions[right])
    var result = (potions[left], potions[right])
    
    while left < right {
        let sum = potions[left] + potions[right]
        
        if abs(sum) < minValue {
            minValue = abs(sum)
            result = (potions[left], potions[right])
        }
        
        if sum == 0 {
            break
        } else if sum < 0{
            left += 1
        } else {
            right -= 1
        }
    }
    
    print(result.0, result.1)
}

//baekjoon2467()
