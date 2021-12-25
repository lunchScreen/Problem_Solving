let t = Int(readLine()!) ?? 0
for _ in 0..<t { print(solution(Array(readLine()!)) ? "YES" : "NO")}

@inline(__always)
func solution(_ str: [Character]) -> Bool {
    var str = str
    while !str.isEmpty {
        switch str.first {
        case "0":
            if str.count < 2 || str[1] != "1" { return false }
            str.removeFirst(2)
        case "1":
            if str.count < 4 || str[1] != "0" || str[2] != "0" { return false }
            str.removeFirst(2)
            str.removeFirst(str.firstIndex() {$0 != "0"} ?? str.count)
            if str.first != "1" { return false }
            let index = str.firstIndex() {$0 != "1"} ?? str.count
            str.removeFirst(index)
            if index > 1 && str.count > 2 && str[0] == "0" && str[1] == "0" { str.insert("1", at: 0) }
        default: return false
        }
    }
    return true
}
