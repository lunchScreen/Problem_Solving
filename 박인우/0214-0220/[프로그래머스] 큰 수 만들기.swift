import Foundation

func solution(_ number:String, _ k:Int) -> String {
    var k = k
    var number = number.compactMap { Int(String($0)) }
    var stack = [Int]()
    
    for n in number {
        if stack.count == 0 {
            stack.append(n)
            continue
        } 
        
        if k == 0 {
            stack.append(n)
            continue
        }
        
        while stack.count > 0 && stack.last! < n && k > 0 {
            stack.removeLast()
            k -= 1
        }
        stack.append(n)
    }
    
    return stack[0...stack.count-1-k].map{ String($0) }.joined()
}
