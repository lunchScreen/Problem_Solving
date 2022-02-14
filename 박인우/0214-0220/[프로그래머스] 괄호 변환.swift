func solution(_ p:String) -> String {
    if p.count < 1 { return "" }

    var count = 0, index = p.startIndex
    
    repeat{
        count += String(p[index]) == "(" ? 1 : -1
        index = p.index(after: index)
    } while count != 0

    var u = String(p[..<index]), v = String(p[index...])
    
    if String(u.first!) == "("{
        return u + solution(v)
    } else {
        u.removeLast()
        u.removeFirst()
        return "(\(solution(v)))\(u.map{String($0) == "(" ? ")" : "("}.joined())"
    }
}

// 직접 푼 코드는 다른 사람풀이 감탄하며 보다가 날아가버림...
// 대충 비슷한데 index 활용을 잘 못했고, u의 첫번째 문자가 "("이면 무조건 올바른 괄호 문자열임을 파악하지 못했다.
