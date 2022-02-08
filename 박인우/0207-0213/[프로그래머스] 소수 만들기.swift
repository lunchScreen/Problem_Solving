import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var sums = Set<Int>()
    
    for a in 0...nums.count-1 {
        if a == nums.count-1 {
            continue
        }
        for b in a+1...nums.count-1 {
            if b == nums.count-1 {
                continue
            }
            for c in b+1...nums.count-1 {
                let sum = nums[a] + nums[b] + nums[c]
                if check(sum) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}

func check(_ num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}
