func solution(_ s:String) -> String {
    var answer: String = ""
    var idx: Int = 0
    for c in s {
        if c.isWhitespace {
            idx = 0
            answer += " "
            continue
        } 
        if idx % 2 == 0 {
            answer += String(c).uppercased()
        } else {
            answer += String(c).lowercased()
        }
        idx += 1
    }    
    return answer
}

func solution(_ s:String) -> String {
    let a = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    return a.map{ $0.map { $0 }.joined() }.joined(separator: " ")
}
