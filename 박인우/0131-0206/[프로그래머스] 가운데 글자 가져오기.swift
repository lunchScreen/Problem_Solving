func solution(_ s:String) -> String {
    return s.count % 2 == 0 ? String(s[s.index(s.startIndex, offsetBy: s.count / 2 - 1)...s.index(s.startIndex, offsetBy: s.count / 2)]) : String(s[s.index(s.startIndex, offsetBy: s.count / 2)])
}
