import Foundation

func solution(_ s:String) -> Int {
    var sa = Array(s).map { String($0) }
    var answer = 0
    
    func check(_ strList: [String]) -> Bool {
        var stack = [String]()
        
        for i in 0..<strList.count {
            if stack.count == 0 {
                stack.append(strList[i])
                continue
            }
            
            if stack.last! == "[" && strList[i] == "]" {
                stack.removeLast()
            } else if stack.last! == "(" && strList[i] == ")" {
                stack.removeLast()
            } else if stack.last! == "{" && strList[i] == "}" {
                stack.removeLast()
            } else {
                stack.append(strList[i])
            }
        }
        
        return stack.count == 0
    }
    
    for _ in 1...sa.count {
        var t = sa.removeFirst()
        sa.append(t)
        if check(sa) {
            answer += 1
        }
    }
    
    return answer
}
