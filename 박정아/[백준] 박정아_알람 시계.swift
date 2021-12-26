import Foundation

func solution() {
    var alarm = (readLine()!).split(separator: " ").map{ Int(String($0))! }
    
    if alarm[0] == 0 && alarm[1] < 45 {
        alarm[0] = 23
        alarm[1] += 15
    } else if alarm[1] < 45 {
        alarm[0] -= 1
        alarm[1] += 15
    } else {
        alarm[1] -= 45
    }
    
    print("\(alarm[0]) \(alarm[1])")
}

solution()

