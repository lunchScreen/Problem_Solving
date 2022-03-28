func solution(_ s:String) -> String {
    var result: String = ""
    var flag = true
    
    for c in s {
        if String(c) == " " {
            flag = true
            result += c.uppercased()
            continue
        }
        
        if flag {
            result += c.uppercased()
            flag = false
        } else {
            result += c.lowercased()
        }
    }
    
    return result
}
