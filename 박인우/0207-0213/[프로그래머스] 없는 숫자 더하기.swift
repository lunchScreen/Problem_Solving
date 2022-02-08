import Foundation

func solution(_ numbers:[Int]) -> Int {
    var list = [0,1,2,3,4,5,6,7,8,9]
    
    for n in numbers {
        list[n] = 0
    }
    
    return list.reduce(0,+)
}
