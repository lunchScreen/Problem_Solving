import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var array = Array(repeating: 1, count: n)
    
    for i in lost {
        array[i-1] = 0
    }
    
    for i in reserve {
        array[i-1] += 1
    }
    
    for i in 0...n-1 {
        if array[i] == 2 {
            if i-1 >= 0 && array[i-1] == 0 {
                array[i-1] += 1
                array[i] -= 1
            } else if i+1 < n && array[i+1] == 0 {
                array[i+1] += 1
                array[i] -= 1
            }
        }
    }
    
    return array.filter {
        $0 > 0
    }.count
}
