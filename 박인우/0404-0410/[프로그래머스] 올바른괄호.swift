import Foundation

func solution(_ s:String) -> Bool
{
    var stack: [Character] = []
    
    for c in s {
        if c == "(" {
            stack.append(c)
        } else if c == ")" && stack.count > 0 && stack.last! == "(" {
            stack.removeLast()
        }
    }

    return stack.count == 0
}
