import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    
    for c in s {
        if stack.count > 0 && stack.last! == c {
            stack.removeLast()
            continue
        } 
        stack.append(c)
    }
    
    return stack.isEmpty ? 1 : 0
}
