import Foundation

func solution(_ s:String) -> Int {
    
    var check = [Int]()
    var stack = [String]()
    var word = ""
    var minValue = 1000
    
    for n in 1...s.count {
        check = []
        stack = []
        for c in s {
            word += String(c)
            if word.count == n {
                if stack.count > 0 && stack.last! == word {
                    check[check.count-1] += 1
                } else {
                    stack.append(word) 
                    check.append(1)
                }
                word = ""
            }
        } 
        stack.append(word)
        word = ""
        minValue = min(stack.joined().count + check.map { $0 > 1 ? String($0) : "" }.joined().count, minValue)
    }
    
    return minValue
}
