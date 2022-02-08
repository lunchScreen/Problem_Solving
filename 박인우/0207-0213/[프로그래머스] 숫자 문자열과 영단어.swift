import Foundation

func solution(_ s:String) -> Int {
    var answer = ""
    let lst = ["zero":"0","one":"1","two":"2","three":"3","four":"4","five":"5","six":"6","seven":"7","eight":"8","nine":"9"]
    
    var word = ""
    for c in s {
        if c.isNumber {
            answer += String(c)
        } else {
            word += String(c)
            if let result = lst[word] {
                answer += result
                word = ""
            }
        }
    }
    
    return Int(answer)!
}
